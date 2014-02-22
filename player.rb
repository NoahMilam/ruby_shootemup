
class Ship
	attr_reader :x, :y, :w, :h
	def initialize(window)
		@image = Gosu::Image.new(window,'Gship.png',false)
		@x = 350
		@y = 550
		@w =60
		@h = 55
		@moveShip = 5
		
	end
	# chage me when you get final ship drawn
	def hitBox
		hitbox_x = ((@x).to_i..(@x + @image.width).to_i).to_a
		hitbox_y = ((@y).to_i..(@y + @image.height).to_i).to_a
		{:x => hitbox_x, :y => hitbox_y}
	end
	
	def moveLeft 
		if x >= 0
			@x -= @moveShip
		end
	end
	def moveRight
		if	x <= 730
			@x += @moveShip
		end
	end
	def moveUp
		if y >= 0
			@y -= @moveShip
		end
	end
	def moveDown
		if y <= 550
			@y += @moveShip
		end
	end
	
	def draw
		@image.draw(@x,@y,StageLayer)
	end
end