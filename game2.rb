class Room
	attr_reader :name, :exit, :description
	def initialize name, description, exit
		@name = name
		@description = description
		@exit = exit
	end
end

class Map 
	attr_reader :rooms
	def initialize 
		@rooms = []
		@rooms.push(Room.new("Bear room", "You entered in a room with a huge bear.", "N"), Room.new("Girlfriend room", "You enter in a room where your exgirlfriend is shouting at you.", "W"), Room.new("Matias room", "You enter in a room where Matias is angry at you because you didn't your pre-work.", "E"), Room.new("Dragon room", "You enter in a room with a f*** dragon. Run man!","S"), Room.new("Hot room", "You enter in a room with a huge fire.", "N"))
		@rooms = @rooms.shuffle
	end
end

class Character
	attr_accessor :lifes
	def initialize name
		@name = name
		@lifes = 3
	end

end

class Game

	def start
		puts "----------------Welcome to Game of Rooms, the ultimate adventure----------------"
		puts "Please select your character name"
		print "> "
		@character_name = gets.chomp
		@character = Character.new(@character_name)
		puts "Get prepared for the adventure, #{@character_name.capitalize}!"
		self.create_map
	end

	def create_map
		@map = Map.new
		@position = 0
		self.check_lifes
	end

	def check_lifes
		if @character.lifes > 0
			self.move
		else
			self.gameover
		end
	end

	def gameover
		puts "GAME OVER. Do you want to play again? ( Y / N )"
		print "> "
		@play_again = gets.chomp
			if @play_again == "Y"
				Game.new.start
			end
	end

	def move	
		@current_position = @map.rooms[@position]
			while @position < @map.rooms.length 
				puts "______________________________________________________________________________________" 
				puts @map.rooms[@position].description
				print "Which direction do you go (N / S / E / W)? > "
				@user_move = gets.chomp.capitalize
					if @map.rooms[@position].exit == @user_move
					@position = @position + 1
					puts ""
					else 
					puts "Trying to go into that direction you found a wall. You hit your head and lose one life"
					@character.lifes = @character.lifes - 1 
					puts "You have #{@character.lifes } lifes remaining."
					puts ""
					self.check_lifes

					end

			end	
	end
end



Game.new.start