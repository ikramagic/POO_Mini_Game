class Player
    attr_accessor :name, :life_points

    def initialize(the_name)
        @name = the_name
        @life_points = 10
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie."
    end

    def gets_damage(damage)
        @life_points - damage
        if points_left <= 0
            puts "Le joueur #{name} a été tué."
    end
end