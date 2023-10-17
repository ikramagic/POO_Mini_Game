class Player
    attr_accessor :name, :life_points
    @@all_players = []

    def initialize(the_name)
        @name = the_name
        @life_points = 10
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie." #affiche le life points correspondant au joueur selectionné
    end

    def gets_damage(damage)
        @life_points -= damage #sert à soustraire les dégats infligés
        if @life_points <= 0 #si la vie est à 0 alors...
            return puts "Le joueur #{name} a été tué." #on arrête et on indique que le joueur est mort
        end
    end

    def attacks(player_hit)
        puts "Le joueur #{self.name} attaque le joueur #{player_hit.name} !" #self = l'instance qui appelle la méthode dans pry, player_hit la variable
        damage_inflicted = compute_damage #récupère un chiffre aléatoire fourni par méthode compute damage pr être utilisé ici
        puts "Le joueur #{self.name} marave #{player_hit.name} et lui retire #{damage_inflicted} points !"
        player_hit.gets_damage(damage_inflicted) #retire les points de vie avec methode gets damage en utilisant chiffre aléatoire fourni
        puts player_hit.show_state #affiche la vie restante au joueur attaqué
    end

    def compute_damage #sert à générer un nombre aléatoire pour l'utiliser après dans l'attaque
        return rand(1..6)
    end
end