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
  end
end
