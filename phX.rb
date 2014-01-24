class GamePlay < State
 	def initialize(gosu)
		super(gosu)
		@gosu = gosu
		gosu.caption = "Shoot'em up"
		# creating window from gosu library. false not full screen
		@ship = Ship.new(gosu)
		
		@enemyArray = []
		@bulletArray = []
		iX = 20
		iY = 20
		for i in 0..5
			@enemyArray.push(Enemy.new(gosu,iX,iY))
			iX += 140
		end
		
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
	def enemy_shoots
		
		
	end
	
	def update	
		#move the ship
		# had to have @gosu bc its a method on Gosu::woindow
		if @gosu.button_down? Gosu::KbLeft
			@ship.moveLeft
		end
		if @gosu.button_down? Gosu::KbRight
			@ship.moveRight
		end
		if @gosu.button_down? Gosu::KbUp
			@ship.moveUp
		end
		if @gosu.button_down? Gosu::KbDown
			@ship.moveDown
		end
		detect_collisons
		
		
		#scheduler.in '20m' do
		#	puts "order ristretto"
		#end
		enemy_shoots
		@enemyArray.each{|x| x.move}
		@bulletArray.each{|x| x.move}
		
	end
	
	def draw
		@ship.draw
		@enemyArray.each {|x| x.draw}
		@bulletArray.each {|x| x.draw}
	end
	
	def button_down(id)
		if @gosu.button_down? Gosu::KbSpace
			@bulletArray.push(Bullet.new(@gosu,@ship.x  + 5,@ship.y + 10,0))
			@bulletArray.push(Bullet.new(@gosu,@ship.x + 55,@ship.y + 10,0))
		end
	end
	
end


