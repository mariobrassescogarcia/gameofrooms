

class Room
	attr_reader :name, :exit, :description
	def initialize name, description
		@name = name
		@description = description
		@exit = "N"
	end
end


class Map 
	attr_reader :rooms
	def initialize rooms
		@rooms = rooms
	end
end


bearroom = Room.new("Bear room", "There's a huge bear in the room. There's a door to the north")
girlfriendroom = Room.new("Girlfriend room", "There's your exgirlfriend trying to break up with up. There's a door to the north")
matiasroom = Room.new("Matias room", "There's Matias shouting at you cause you didn't your pre-work. There's a door to the north")
dragonroom = Room.new("Dragon room", "There's a f*** dragon in this room. There's a door to the north")
hotroom = Room.new("Hot room", "There's a fire in this room. You are dead")

mariorooms = [bearroom, girlfriendroom, matiasroom, dragonroom, hotroom]

marioland = Map.new(mariorooms)


class Character
	attr_reader :name, :current_position, :rooms
	def initialize name, rooms
		@name = name
		@rooms = rooms
		@position = 0
		@current_position = @rooms[@position]
	end

	def move
		while @position < @rooms.length  

			puts @rooms[@position].description
			print "> "
				user_move = gets.chomp.capitalize
					if @rooms[@position].exit == user_move
					@position = @position + 1
					else 
					puts "You can't go there"
					end
		end
	
	end
end

supermario = Character.new("Super Mario", mariorooms)

supermario.move

