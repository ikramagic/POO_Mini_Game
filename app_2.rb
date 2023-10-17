require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "______________________________________|                                        |____________________________________"
puts "______________________________________|                                        |____________________________________"
puts "______________________________________|                                        |____________________________________"
puts "______________________________________|     Bienvenue dans 'YOU VS. CAMELS     |____________________________________"
puts "______________________________________|    Affrontez de bots chameaux moches   |____________________________________"
puts "______________________________________|                ▬▬ι═══════>             |____________________________________"
puts "______________________________________|           Tentez de survivre !         |____________________________________"
puts "______________________________________|                                        |____________________________________"

puts "\n\nComment tu t'appelles ? "
print "\n\n>>>" 
name = gets.chomp

player_human = HumanPlayer.new(name)
player2 = Player.new("Chammelle de Justinie")
player3 = Player.new("Dromadaire de Gérardie")

ennemies = [player2, player3]

puts "\n\nBienvenue dans l'arène cryptique.\n\n"
puts player_human.show_state


while player_human.life_points >0 && (player2.life_points > 0 || player3.life_points >0)
    puts "______________________________________| !!! CHOOSE OR DIE !!! |____________________________________"
    puts "______________________________________| !!!     DEBUT     !!! |____________________________________\n\n"

    puts player_human.show_state

    puts "︻デ┳═ー \nTu veux jouer ? \nSuis les consignes du menu."
    puts "︻デ┳═ー"
    puts " "
    puts "a ----> Tu cherches une arme ?"
    puts "s ----> T'es en PLS et t'as besoin de vie ?"
    puts "Tu te sens chaud pour attaquer qui, choisis :"
    puts "0 ----> #{player2.name} a #{player2.life_points} points de vie"
    puts "1 ----> #{player3.name} a #{player3.life_points} points de vie"
    puts " "
    puts "(╯°_°）╯︵ ━━━ \nTu veux quitter le jeu ? \nTape exit en minuscule"
    puts "(╯°_°）╯︵ ━━━"
    puts "______________________________________| !!! CHOOSE OR DIE !!! |____________________________________"
    puts "______________________________________| !!!      FIN      !!! |____________________________________\n\n"

    print ">>>>>>>>>>>" 
    choose = gets.chomp
    case choose
    when "a"
        player_human.search_weapon
    when "s"
        player_human.search_health_pack
    when "0"
        puts player_human.attacks(player2)
    when "1"
        puts player_human.attacks(player3)
    when "exit"
        break
    else puts "\n Non... ಠ_ಠ \n Un menu a sa raison d'être. \n Utilise donc ce menu."
    end
    ennemies.each do |bot_player|
        puts "Les CamelBots t'attaquent !"
        if bot_player.life_points >= 0 #le bot ne peut attaquer que si sa vie est supérieure à 0
            bot_player.attacks(player_human)
        end
    end
end