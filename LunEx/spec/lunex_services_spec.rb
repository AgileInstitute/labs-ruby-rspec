require "lunex_services"

describe LunexServices do
  describe "#current_price" do
    it "sleeps five seconds" do
      my_service = LunexServices.new
      allow(my_service).to receive(:raise)
      expect(my_service).to receive(:sleep).with(5)
      my_service.current_price("HE3")
    end

    it "randomly raises 20% of the time" do
      my_service = LunexServices.new
      allow(my_service).to receive(:sleep)
      expect(my_service).to receive(:rand).with(100).and_return(81)
      expect { my_service.current_price("HE3") }
        .to raise_error("Sorry, sunspot activity today...please try again later")
    end

    it "returns a random price each time" do
      my_service = LunexServices.new
      allow(my_service).to receive(:sleep)
      expect(my_service).to receive(:rand).and_return(1, 5, 1, 13)
      expect(my_service.current_price("HE3")).to equal(47)
      expect(my_service.current_price("HE3")).to equal(55)
    end
  end
end
