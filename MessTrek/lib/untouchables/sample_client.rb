puts "Simple Star Trek"

require_relative "web_gadget"
require_relative "../klingon"
require_relative "../game"

game = Game.new()
wg = WebGadget.new({"command" => "phaser",
                    "amount" => "1000",
                    "target" => Klingon.new(rand(1000), 800)})
game.fire_weapon(wg)
