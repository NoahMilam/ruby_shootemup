
class Enemy
	attr_reader :x, :y, :w, :h
	def initialize(window,iX,iY)
		@image = Gosu::Image.new(window,'enemy1.png',false)
		@x = iX
		@y = iY
		@moveShip = 3
		@direction = "left"
		@edgeLeft = iX - 50
		@edgeDown = iY + 100
		@edgeRight = @x
		@edgeUp = @y
		@shot_time = 0
		@shot_rate = 10* rand(15..20)
	end

	def hitBox
		hitbox_x = ((@x).to_i..(@x + @image.width).to_i).to_a
		hitbox_y = ((@y).to_i..(@y + @image.height).to_i).to_a
		{:x => hitbox_x, :y => hitbox_y}
	end
	
	def shoot_count
		@shot_time += 1
		if @shot_time == @shot_rate
			@shot_time = 0
			 
		end
	end
	
	def get_shot_time
		return @shot_time
	end
	
	def move 
		if @direction == "left" 
			@x -= @moveShip
			if @x <= @edgeLeft
				@direction = "down"
			end
		end
		if	@direction == "right"
			@x += @moveShip
			if @x >= @edgeRight
				@direction = "up"
			end
		end
		if @direction == "up"
			@y -= @moveShip
			if @y <= @edgeUp
				@direction = "left"
			end
		end
		if @direction == "down"
			@y += @moveShip
			if @y >= @edgeDown
				@direction = "right"
			end
		
		end
	end	
	
	def draw
		@image.draw(@x,@y,StageLayer)
	end

end
