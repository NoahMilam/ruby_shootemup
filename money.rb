
class Money
	
	def initialize(window,iX,iY)
		@image = Gosu::Image.new(window,'money.png',false)
		@x = iX
		@y = iY
	end

	def hitBox
		hitbox_x = ((@x).to_i..(@x + @image.width).to_i).to_a
		hitbox_y = ((@y).to_i..(@y + @image.height).to_i).to_a
		{:x => hitbox_x, :y => hitbox_y}
	end
	
		
	def move 
		@x = @x
		@y += 9
	end	
	
	def draw
		@image.draw(@x,@y,StageLayer)
	end

end
