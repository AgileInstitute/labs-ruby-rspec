require 'square'

describe "square function" do
  it "works for trivial cases" do
    maths = MyMath.new
    expect(maths.square(2)).to eq(4)
    expect(maths.square(3)).to eq(9)
  end
end
