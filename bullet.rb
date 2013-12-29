class Bullet
	attr_reader :x, :y, :w, :h
	def initialize(window,iX,iY)
		@x =iX
		@y = iY
		@image = Gosu::Image.new(window,'bullet.png',false)
		puts (@image.height).to_i
	end
	
	def hitBox
		hitbox_x = ((@x).to_i..(@x + @image.width.to_i)).to_a
		hitbox_y = ((@y).to_i..(@y + @image.height).to_i).to_a
		{:x => hitbox_x, :y => hitbox_y}
	end
	
	def move
		@y -= 8
	end
	
	def draw
		@image.draw(@x,@y,1)
	end
end