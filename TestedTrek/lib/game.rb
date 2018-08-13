require "klingon"

class Game
  MAX_PHASER_RANGE = 4000

  attr_reader :e
  #     self.t = 8;

  def initialize
    @e = 10_000
  end

  def fire_weapon(wg)
#         if wg.parameter("command") == "phaser"
    if true # FIX-ME
      amount = wg.parameter("amount").to_i
      enemy = wg.variable("target")
      if @e >= amount
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
            wg.write_line("Klingon destroyed!");
            enemy.destroy();
          end
        end
        @e -= amount;
      else
        wg.write_line("Insufficient energy to fire phasers!")
      end
    else
    end
  end

#            end
#        end else if(wg.parameter("command") == "photon") do
#             enemy = wg.variable("target");
#             if(self.t > 0) do
#                 distance = enemy.distance;
#                 if ((self.randomWithinLimitOf(4) + ((distance / 500) + 1) > 7)) do
#                     wg.write_line("Torpedo missed Klingon at " + distance + " sectors...");
#                end else do
#                     damage = 800 + self.randomWithinLimitOf(50);
#                     wg.write_line("Photons hit Klingon at " + distance + " sectors with " + damage + " units");
#                     if (damage < enemy.energy) do
#                         enemy.energy = enemy.energy - damage;
#                         wg.write_line("Klingon has " + enemy.energy + " remaining");
#                    end else do
#                         wg.write_line("Klingon destroyed!");
#                         enemy.destroy();
#                    end
#                end
#                 self.t--;
#            end else do
#                 wg.write_line("No more photon torpedoes!");
#            end

end
