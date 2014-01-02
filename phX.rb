require 'rubygems'
require 'gosu'
require './player'
require './enemy'
require './bullet'
 
 class GameWindow < Gosu::Window 
 #class GameWindow < State
 	#def initialize(gosu)
	#	super(gosu)
	#	self.caption = "Shoot'em up"
		# creating window from gosu library. false not full screen
	def initialize
		super 800, 600, false
		@game_running = false
		@font = Gosu::Font.new(self, 'Inconsolata-dz', 24)
		title_screen
		#game_setup
		
	end
	#going to change this to its own class
	def title_screen
	@selection = ["PLAY press s","PASSWORD"]
	end
	
	def game_setup
		@ship = Ship.new(self)
		@enemyArray = []
		@bulletArray = []
		iX = 20
		iY = 20
		for i in 0..5
			@enemyArray.push(Enemy.new(self,iX,iY))
			iX += 140
		end
		@game_running = true
	end
	
	def detect_collisons
		@enemyArray.each do |badGuy|
			@bulletArray.each do |bullet|
				if collison?(badGuy,bullet)
					puts 'kaboom'
					@enemyArray.delete(badGuy)
					@bulletArray.delete(bullet)
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
		
		if button_down? Gosu::KbS
		game_setup
		end
		#move the ship
		
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
		if @game_running
			detect_collisons
			@enemyArray.each{|x| x.move}
			@bulletArray.each{|x| x.move}
		end
	end
	
	def draw
		unless @game_running
			@font.draw("SHOOT'EM", 240, 100, 50, 2.8, 2.8, 0xffffffff)
			@font.draw(@selection.fetch(0), 240, 200, 50, 2, 2, 0xffffffff)
			@font.draw(@selection.fetch(1), 240, 300, 50, 2, 2, 0xffffffff)			
		end	
		return unless @game_running
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
