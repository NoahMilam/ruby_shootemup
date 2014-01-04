
class Ship
	attr_reader :x, :y, :w, :h
	def initialize(window)
		@image = Gosu::Image.new(window,'sShip.png',false)
		@x = 350
		@y = 550
		@w =60
		@h = 55
		@moveShip = 5
		
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