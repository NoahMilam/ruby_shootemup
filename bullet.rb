class Bullet
	attr_reader :x, :y, :w, :h
	def initialize(window,iX,iY,id)
		@x =iX
		@y = iY
		player_or_enemy = [ Gosu::Image.new(window,'enemy_bullet.png',false),
							Gosu::Image.new(window,'bullet.png',false), 
							Gosu::Image.new(window,'bullet2.png',false),
							Gosu::Image.new(window,'bullet3.png',false), 
							Gosu::Image.new(window,'bullet3.png',false), 
							Gosu::Image.new(window,'bullet3.png',false), 
							Gosu::Image.new(window,'bullet3.png',false)]
		#pass in if enemy or player
		@image = player_or_enemy[id]
		
	end
	
	def hitBox
		hitbox_x = ((@x).to_i..(@x + @image.width.to_i)).to_a
		hitbox_y = ((@y).to_i..(@y + @image.height).to_i).to_a
		{:x => hitbox_x, :y => hitbox_y}
	end
	
	def move
		@y -= 8
		@x = @x
	end
	def enemy_move
		@y += 6
	end
	
	def draw
		@image.draw(@x,@y,2)
	end
end

class Right_bullet < Bullet
	def move
		@y -= 7
		@x += 2
	end
end

class Left_bullet < Bullet
	def move
		@y -= 7
		@x -= 2
	end
end