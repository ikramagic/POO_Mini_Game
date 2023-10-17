require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry

player1 = Player.new("Justine")
player2 = Player.new("Gérard")

puts "______>______>______| Bienvenue dans CamelFight Simulator |______<______<______"

puts "\nVoici la jauge de CamelVie de nos deux joueurs :"
    player1.show_state
    player2.show_state

    puts "\nPassons à la phase d'attaque :"

while player1.life_points > 0 && player2.life_points > 0 do
    player1.attacks(player2)

if player2.life_points <= 0
    break
end

player2.attacks(player1)
if player1.life_points <= 0
    break
end

end

puts "________________________________________\n"

puts "\nFin du match.\nScore final :"
player1.show_state
player2.show_state