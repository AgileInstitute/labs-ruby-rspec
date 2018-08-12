require "game"
require "untouchables/web_gadget"

describe "phasers" do

    before(:each) do
        @game = Game.new
        @energy_before = @game.e
        @wg = instance_double(WebGadget, write_line: nil )
    end

    it "should complain with insufficient energy when not available" do
        # given
        allow(@wg).to receive(:parameter).and_return(@game.e + 1)

        # when
        @game.fire_weapon(@wg)

        # then
        expect(@wg).to have_received(:write_line)
          .with("Insufficient energy to fire phasers!")
    end
#
#     describe "when Klingon out of range" do
#         var outOfRange
#         var energyToFire = 1000
#         beforeEach(function() {
#             outOfRange = game.maxPhaserRange + 1
#             ui.target = new Klingon(outOfRange)
#             ui.commandParameter = energyToFire
#             game.processCommand(ui)
#         end
#
#         it "reports out-of-range" do
#             expect(ui.writeLine).toHaveBeenCalledWith("Klingon out of range of phasers at " + outOfRange + " sectors...")
#         end
#
#         it "still subtracts the energy" do
#             expect(game.e).toBe(energyBefore - energyToFire)
#         end
#     end
#
#     describe "when Klingon destroyed by sufficient strike" do
#         var klingon
#         beforeEach(function() {
#             klingon = new Klingon(2000, 200)
#             spyOn(klingon, "destroy")
#             ui.target = klingon
#             ui.commandParameter = 1000
#             spyOn(game, "generator").and.returnValue(0)
#
#             game.processCommand(ui)
#         end
#
#         it "reports hit and destroyed" do
#             expect(ui.writeLine).toHaveBeenCalledWith("Phasers hit Klingon at 2000 sectors with 500 units")
#             expect(ui.writeLine).toHaveBeenCalledWith("Klingon destroyed!")
#         end
#
#         it "subtracts energy" do
#             expect(game.e).toBe(energyBefore - 1000)
#         end
#
#         it "really destroys" do
#             expect(klingon.destroy).toHaveBeenCalled()
#         end
#     end
#
#     describe "when damaging Klingon" do
#         beforeEach(function() {
#             ui.target = new Klingon(2000, 200)
#             ui.commandParameter = 50
#             spyOn(game, "generator").and.returnValue(0)
#
#             game.processCommand(ui)
#         end
#
#         it "reports damage" do
#             expect(ui.writeLine).toHaveBeenCalledWith("Phasers hit Klingon at 2000 sectors with 25 units")
#             expect(ui.writeLine).toHaveBeenCalledWith("Klingon has 175 remaining")
#         end
#
#         it "subtracts energy" do
#             expect(game.e).toBe(energyBefore - 50)
#         end
#     end
#
#
#     describe "a defect when firing zero" do
#         beforeEach(function() {
#             ui.target = new Klingon(2000, 200)
#             ui.commandParameter = 0
#             spyOn(game, "generator").and.returnValue(0)
#
#             game.processCommand(ui)
#         end
#
#         it "reports miscalculated damage!" do
#             expect(ui.writeLine).toHaveBeenCalledWith("Phasers hit Klingon at 2000 sectors with 1 units")
#             expect(ui.writeLine).toHaveBeenCalledWith("Klingon has 199 remaining")
#         end
#
#         it "mistakenly doesn't subtract that one unit" do
#             expect(game.e).toBe(energyBefore)
#         end
#     end
end
