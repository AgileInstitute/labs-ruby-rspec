require "lunex_services"

describe LunexServices do
  describe "#current_price" do
    it "sleeps five seconds" do
      my_service = LunexServices.new
      allow(my_service).to receive(:raise)
      expect(my_service).to receive(:sleep).with(5)
      my_service.current_price("HE3")
    end
  end
end
