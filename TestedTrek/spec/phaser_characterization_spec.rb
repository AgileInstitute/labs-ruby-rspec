require "game"
require "klingon"
require "untouchables/web_gadget"

describe "phasers" do

    before(:each) do
        @game = Game.new
        @energy_before = @game.e
        @wg = instance_double(WebGadget, write_line: nil )
        expect(@wg).to receive(:parameter).with("command").and_return("phaser")
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

    describe "when Klingon out of range" do
      energy_to_fire = 1000

      before(:each) do
        @out_of_range = Game::MAX_PHASER_RANGE + 1
        allow(@wg).to receive(:variable).with("target")
          .and_return(Klingon.new(@out_of_range))
        allow(@wg).to receive(:parameter).and_return(energy_to_fire)
        @game.fire_weapon(@wg)
      end

        it "reports out-of-range" do
            expect(@wg).to have_received(:write_line)
              .with("Klingon out of range of phasers at #{@out_of_range} sectors...")
        end

        it "still subtracts the energy" do
            expect(@game.e).to eq(@energy_before - energy_to_fire)
        end
    end

    describe "when Klingon destroyed by sufficient strike" do
        before(:each) do
          @klingon = Klingon.new(2000, 200)
          allow(@wg).to receive(:variable).with("target")
            .and_return(@klingon)

          allow(@klingon).to receive(:destroy)
          allow(@wg).to receive(:parameter).and_return(1000)
          expect(@game).to receive(:rand)
            .and_return(0)

          @game.fire_weapon(@wg)
        end

        it "reports hit and destroyed" do
            expect(@wg).to have_received(:write_line)
  .with("Phasers hit Klingon at 2000 sectors with 500 units")
            expect(@wg).to have_received(:write_line)
  .with("Klingon destroyed!")
        end

        it "subtracts energy" do
            expect(@game.e).to eq(@energy_before - 1000)
        end

        it "really calls destroy" do
            expect(@klingon).to have_received(:destroy)
        end
    end

    describe "when damaging Klingon" do
        before(:each) do
          @klingon = Klingon.new(2000, 200)
          allow(@wg).to receive(:variable).with("target")
            .and_return(@klingon)

            allow(@wg).to receive(:parameter).and_return(50)
            expect(@game).to receive(:rand)
              .and_return(0)

            @game.fire_weapon(@wg)
        end

        it "reports damage" do
            expect(@wg).to have_received(:write_line)
  .with("Phasers hit Klingon at 2000 sectors with 25 units")
            expect(@wg).to have_received(:write_line)
  .with("Klingon has 175 remaining")
        end

        it "subtracts energy" do
            expect(@game.e).to eq(@energy_before - 50)
        end
    end

    describe "minimum damage of one - yes taking zero to fire is a bug" do
        before(:each) do
          @klingon = Klingon.new(2000, 200)
          allow(@wg).to receive(:variable).with("target")
            .and_return(@klingon)
            allow(@wg).to receive(:parameter).and_return(0)
            expect(@game).to receive(:rand)
              .and_return(0)

            @game.fire_weapon(@wg)
        end

        it "reports minimal damage" do
            expect(@wg).to have_received(:write_line)
  .with("Phasers hit Klingon at 2000 sectors with 1 units")
            expect(@wg).to have_received(:write_line)
  .with("Klingon has 199 remaining")
        end

        it "doesn't subtract that one minimal unit" do
            expect(@game.e).to eq(@energy_before)
        end
    end
end
