class Player
    attr_accessor :name, :life_points, :weapon_level
    @@all_players = []

    def initialize(the_name)
        @name = the_name
        @life_points = 10
        @weapon_level = 0
    end

    def show_state
        puts "#{@name} a #{@life_points} points de CamelVie et une arme de niveau #{@weapon_level}." #affiche le life points correspondant au joueur selectionné
    end

    def gets_damage(damage)
        @life_points -= damage #sert à soustraire les dégats infligés
        if @life_points <= 0 #si la vie est à 0 alors...
            return puts "RIP. \n#{name} a été tué." #on arrête et on indique que le joueur est mort
        end
    end

    def attacks(player_hit)
        puts "#{self.name} attrape #{player_hit.name}. \n#{self.name} lui assène un coup de babouche cosmique !" #self = l'instance qui appelle la méthode dans pry, player_hit la variable
        damage_inflicted = compute_damage #récupère un chiffre aléatoire fourni par méthode compute damage pr être utilisé ici
        puts "#{self.name} marave son adversaire bien comme il faut. \n#{player_hit.name} a perdu #{damage_inflicted} points de vie suite à l'attaque de #{self.name}!"
        player_hit.gets_damage(damage_inflicted) #retire les points de vie avec methode gets damage en utilisant chiffre aléatoire fourni
    end

    def compute_damage #sert à générer un nombre aléatoire pour l'utiliser après dans l'attaque
        return rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(the_name)
        super(the_name)
        @life_points = 100
        @weapon_level = 2
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        dice = rand(1..6)
        if dice > @weapon_level
            puts "Tu as trouvé une arme de niveau #{dice}."
            puts "Bravo! L'arme trouvée est de meilleur niveau! On la garde."
            @weapon_level = dice
        else
            puts "Tu as trouvé une arme de niveau #{dice}."
            puts "Pas de bol! L'arme trouvée est nulle. Laisse tomber, tu gardes ton arme actuelle."
        end
    end

    def search_health_pack
        dice = rand(1..6)
        if dice == 1
            puts "Oh, oh... pas de chance ! "
        elsif dice == 2 || dice == 3 || dice == 4 || dice == 5
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            @life_points = self.life_points + 50
        elsif dice == 6
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
            @life_points = self.life_points + 80
        end
    end
end