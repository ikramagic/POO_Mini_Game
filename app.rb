require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry

player1 = Player.new("Justine")
player2 = Player.new("Gérard")

puts "Voici l'état de nos deux joueurs :"
player1.show_state
player2.show_state

puts "Passons à la phase d'attaquer :"