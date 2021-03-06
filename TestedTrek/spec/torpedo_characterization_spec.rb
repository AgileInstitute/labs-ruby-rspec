require "game"
require "klingon"
require "untouchables/web_gadget"

shared_examples "a torpedo reducer" do
  it "reduces torpedoes available" do
    expect(@game.t).to eq(7)
  end
end

describe "photon torpedoes" do
  before(:each) do
    @game = Game.new
    @wg = instance_double(WebGadget, write_line: nil )
    expect(@wg).to receive(:parameter).with("command")
      .and_return("photon").twice
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

  describe "when random drift over distance causes torpedo to miss" do
    before(:each) do
      distance_where_torpedoes_drift = 3000
      expect(@game).to receive(:rand)
        .and_return(1) # just enough to miss
      allow(@wg).to receive(:variable).with("target")
        .and_return(Klingon.new(distance_where_torpedoes_drift, 200))

      @game.fire_weapon(@wg)
    end

    it "reports torpedo missed" do
      expect(@wg).to have_received(:write_line)
        .with("Torpedo missed Klingon at 3000 sectors...")
    end

    it_behaves_like "a torpedo reducer"
  end

  describe "how photon always misses when Klingon is quite far away, \
            presumably due to clever evasive actions" do
    before(:each) do
      distance_where_torpedoes_always_miss = 3500
      allow(@wg).to receive(:variable).with("target")
        .and_return(Klingon.new(distance_where_torpedoes_always_miss, 200))

      @game.fire_weapon(@wg)
    end

    it "reports torpedo missed" do
      expect(@wg).to have_received(:write_line)
        .with("Torpedo missed Klingon at 3500 sectors...")
    end

    it_behaves_like "a torpedo reducer"
  end

  describe "when Klingon destroyed" do
    before(:each) do
      @klingon = Klingon.new(500, 200)
      allow(@klingon).to receive(:destroy)
      allow(@wg).to receive(:variable).with("target")
        .and_return(@klingon)
      allow(@game).to receive(:rand)
        .and_return(0, 42)

      @game.fire_weapon(@wg)
    end

    it "reports Klingon destroyed" do
      expect(@wg).to have_received(:write_line)
        .with("Photons hit Klingon at 500 sectors with 842 units")
      expect(@wg).to have_received(:write_line)
        .with("Klingon destroyed!")
    end

    it_behaves_like "a torpedo reducer"

    it "actually destroys Klingon" do
      expect(@klingon).to have_received(:destroy)
    end
  end

  describe "when Klingon damaged" do
    before(:each) do
      allow(@wg).to receive(:variable).with("target")
        .and_return(Klingon.new(500, 2000))
      allow(@game).to receive(:rand)
        .and_return(0, 42)

      @game.fire_weapon(@wg)
    end

    it "reports damage" do
      expect(@wg).to have_received(:write_line)
        .with("Photons hit Klingon at 500 sectors with 842 units")
      expect(@wg).to have_received(:write_line)
        .with("Klingon has 1158 remaining")
    end

    it_behaves_like "a torpedo reducer"
  end
end
