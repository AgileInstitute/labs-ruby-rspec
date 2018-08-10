require "lunex_services"

describe LunexServices do
  describe "#current_price" do
    SAFE_SUNSPOT_VALUE = 80

    let(:my_service) { LunexServices.new }

    before(:each) do
      allow(my_service).to receive(:sleep)
      allow(my_service).to receive(:rand).and_return(SAFE_SUNSPOT_VALUE)
    end

    it "sleeps five seconds" do
      expect(my_service).to receive(:sleep).with(5)
      my_service.current_price("HE3")
    end

    it "randomly raises error 20% of the time" do
      expect(my_service).to receive(:rand).with(100)
        .and_return(SAFE_SUNSPOT_VALUE + 1)
      expect { my_service.current_price("HE3") }
        .to raise_error("Sorry, sunspot activity today...please try again later")
    end

    it "returns a random price each time" do
      expect(my_service).to receive(:rand)
        .and_return(SAFE_SUNSPOT_VALUE, 5, SAFE_SUNSPOT_VALUE, 13)
      expect(my_service.current_price("HE3")).to equal(47)
      expect(my_service.current_price("HE3")).to equal(55)
    end
  end
end
