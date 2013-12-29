require 'rubygems'
require 'gosu'
require './player'
require './enemy'
require './bullet'
 
 class GameWindow < Gosu::Window 
	# creating window from gosu library. false not full screen
	def initialize
		super 800, 600, false
		self.caption = "Shoot'em up"
		
		@ship = Ship.new(self)
		@enemyArray = []
		@bulletArray = []
		iX = 20
		iY = 20
		for i in 0..5
			@enemyArray.push(Enemy.new(self,iX,iY))
			iX += 140
		end
	end
	def detect_collisons
		@enemyArray.each do |badGuy|
			@bulletArray.each do |bullet|
				if collison?(badGuy,bullet)
					puts 'kaboom'
				end
			end
		end
	end
	def collison?(object_1,object_2)
			hitbox_1, hitbox_2 = object_1.hitBox, object_2.hitBox
			common_x = hitbox_1[:x] & hitbox_2[:x]
			common_y = hitbox_1[:y] & hitbox_2[:y]
			common_x.size > 0 && common_y.size > 0 
		end
	
	def update
		#move the ship
		detect_collisons
		if button_down? Gosu::KbLeft
			@ship.moveLeft
		end
		if button_down? Gosu::KbRight
			@ship.moveRight
		end
		if button_down? Gosu::KbUp
			@ship.moveUp
		end
		if button_down? Gosu::KbDown
			@ship.moveDown
		end
		
		@enemyArray.each{|x| x.move}
		@bulletArray.each{|x| x.move}
	end
	def draw
		@ship.draw
		
		@enemyArray.each {|x| x.draw}
		@bulletArray.each {|x| x.draw}
	end
	def button_down(id)
		if id == Gosu::KbSpace
			@bulletArray.push(Bullet.new(self,@ship.x  + 5,@ship.y + 10))
			@bulletArray.push(Bullet.new(self,@ship.x + 55,@ship.y + 10))
		end
	end
end
window = GameWindow.new
window.show
