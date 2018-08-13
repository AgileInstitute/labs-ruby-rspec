require "game"
require "klingon"
require "untouchables/web_gadget"

describe "photon torpedoes" do

      before(:each) do
          @game = Game.new
          @wg = instance_double(WebGadget, write_line: nil )
          expect(@wg).to receive(:parameter).with("command").and_return("photon")
      end

    it "reports when no torpedoes remain" do
        # given
        @game.t = 0

        # when
        @game.fire_weapon(@wg)

        # then
        expect(@wg).to have_received(:write_line)
          .with("No more photon torpedoes!")
    end

#     describe "when random drift over distance causes torpedo to miss" do
#         before(:each) do
#             var distanceWhereRandomFactorsHoldSway = 3000
#             @wg.target = new Klingon(distanceWhereRandomFactorsHoldSway, 200)
#
#             @game.fire_weapon(@wg)
#         end
#
#         it "reports torpedo missed" do
#             expect(@wg).to have_received(:write_line)
# .with("Torpedo missed Klingon at 3000 sectors...")
#         end
#
#         it "reduces torpedoes available" do
#             expect(@game.t).to equal(7)
#         end
#     end
#
#     describe "how photon always misses when Klingon is quite far away, presumably due to clever evasive actions" do
#         before(:each) do
#             var distanceWhereTorpedoesAlwaysMiss = 3500
#             @wg.target = new Klingon(distanceWhereTorpedoesAlwaysMiss, 200)
#
#             @game.fire_weapon(@wg)
#         end
#
#         it "reports torpedo missed" do
#             expect(@wg).to have_received(:write_line)
# .with("Torpedo missed Klingon at 3500 sectors...")
#         end
#
#         it "reduces torpedoes available" do
#             expect(@game.t).to equal(7)
#         end
#     end
#
#     describe "when Klingon destroyed" do
#         var klingon
#         before(:each) do
#             klingon = new Klingon(500, 200)
#             spyOn(klingon, "destroy")
#             @wg.target = klingon
#
#             @game.fire_weapon(@wg)
#         end
#
#         it "reports Klingon destroyed" do
#             expect(@wg).to have_received(:write_line)
# .with("Photons hit Klingon at 500 sectors with 850 units")
#             expect(@wg).to have_received(:write_line)
# .with("Klingon destroyed!")
#         end
#
#         it "subtracts a torpedo" do
#             expect(@game.t).to equal(7)
#         end
#
#         it "actually destroys Klingon" do
#             expect(klingon.destroy).toHaveBeenCalled()
#         end
#     end
#
#     describe "when Klingon damaged" do
#         before(:each) do
#             @wg.target = new Klingon(500, 2000)
#
#             @game.fire_weapon(@wg)
#         end
#
#         it "reports damage" do
#             expect(@wg).to have_received(:write_line)
# .with("Photons hit Klingon at 500 sectors with 850 units")
#             expect(@wg).to have_received(:write_line)
# .with("Klingon has 1150 remaining")
#         end
#
#         it "subtracts a torpedo" do
#             expect(@game.t).to equal(7)
#         end
#     end
# end
#
end
