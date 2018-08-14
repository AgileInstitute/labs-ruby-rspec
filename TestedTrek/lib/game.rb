require_relative "klingon"

class Game
  MAX_PHASER_RANGE = 4000

  attr_reader :e
  attr_accessor :t

  def initialize
    @e = 10_000
    @t = 8
  end

  def fire_weapon(wg)
    if wg.parameter("command") == "phaser"
      amount = wg.parameter("amount").to_i
      if @e >= amount
        enemy = wg.variable("target")
        distance = enemy.distance
        if distance > Game::MAX_PHASER_RANGE
          wg.write_line("Klingon out of range of phasers at #{distance} sectors...")
        else
          damage = amount - (((amount / 20.0) * distance / 200.0) + rand(200)).to_i
          if damage < 1
            damage = 1
          end
          wg.write_line("Phasers hit Klingon at #{distance} sectors with #{damage} units")
          if (damage < enemy.energy)
            enemy.energy = enemy.energy - damage
            wg.write_line("Klingon has #{enemy.energy} remaining")
          else
            wg.write_line("Klingon destroyed!")
            enemy.destroy()
          end
        end
        @e -= amount
      else
        wg.write_line("Insufficient energy to fire phasers!")
      end
    else
      if wg.parameter("command") == "photon"
        if @t > 0
          enemy = wg.variable("target")
          distance = enemy.distance
          if rand(4) + ((distance / 500) + 1) > 7
            wg.write_line("Torpedo missed Klingon at #{distance} sectors...")
          else
            damage = 800 + rand(50)
            wg.write_line("Photons hit Klingon at #{distance} sectors with #{damage} units")
            if (damage < enemy.energy)
              enemy.energy = enemy.energy - damage
              wg.write_line("Klingon has #{enemy.energy} remaining")
            else
              wg.write_line("Klingon destroyed!")
              enemy.destroy()
            end
         end
          @t -= 1
        else
          wg.write_line("No more photon torpedoes!")
        end
      end
    end
  end
end
