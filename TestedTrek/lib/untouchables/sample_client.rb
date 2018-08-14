puts "Simple Star Trek"

$LOAD_PATH.push File.dirname(__FILE__)
$LOAD_PATH.push File.join(File.dirname(__FILE__), "..")

require "web_gadget"
require "klingon"
require "game"

game = Game.new()
wg = WebGadget.new({"command" => "phaser",
                    "amount" => "1000",
                    "target" => Klingon.new(rand(1000), 800)})
game.fire_weapon(wg)
