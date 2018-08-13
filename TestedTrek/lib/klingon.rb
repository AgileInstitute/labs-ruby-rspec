class Klingon
  attr_reader :distance
  attr_accessor :energy

  def initialize(initial_distance = nil, initial_energy = nil)
    @distance = initial_distance || (100 + rand(4000).floor)
    @energy = initial_energy || (1000 + rand(2000).floor)
  end
end
