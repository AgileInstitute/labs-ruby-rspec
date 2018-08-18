require 'square'

describe "square function" do
  let(:maths) { MyMath.new }

  it "squares two" do
    expect(maths.square(2)).to eq(4)
  end

  it "squares three" do
    expect(maths.square(3)).to eq(9)
  end
end
