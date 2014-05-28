class GamePlay < State
 	def initialize(gosu)
		super(gosu)
		@font = Gosu::Font.new(@gosu, "Helvetica Bold", 40)
		@gosu = gosu
		gosu.caption = "STAY RAD"
		@bullet_id = 2
		# creating window from gosu library. false not full screen
		@ship = Ship.new(gosu)
		@levelArray = []
		read_file
		@enemyArray = []
		@bulletArray = []
		@enemybulletArray = []
		@moneyArray = []
		@money = 0
		iX = 20
		iY = 20
		for i in 0..5
			@enemyArray.push(Enemy.new(gosu,iX,iY))
			iX += 140
		end
		
	end
	
	 def read_file
	# #open file
	# #read 3 lines at a time put in a class
	# #loop through
	 file = File.open('levels.txt','r') 
		 while !file.eof?
			 level = file.readline
			 enemy = file.readline
			 pattern = file.readline
			 @levelArray.push(Level.new(level,enemy,pattern))
			 end
			 @levelArray.each do |numb|
				numb.get_level
			end
	 end
	
	def detect_collisons
		@enemyArray.each do |badGuy|
			@bulletArray.each do |bullet|
				if collison?(badGuy,bullet)
					puts 'kaboom'
					@moneyArray.push(Money.new(@gosu,badGuy.get_x,badGuy.get_y))
					@enemyArray.delete(badGuy)
					@bulletArray.delete(bullet)
					
				end
			end
		end
	end
	
	
	def player_hit
		@enemybulletArray.each do |bullet|
			if collison?(@ship,bullet)
				@enemybulletArray.delete(bullet)
				puts "you are dead mother fucka"
			end
		end
		@moneyArray.each do |bills|
			if collison?(@ship,bills)
				@moneyArray.delete(bills)
				@money += 20
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
		@enemyArray.each { |enemy| enemy.shoot_count}
			
			 @enemyArray.each do |enemy|
				if enemy.get_shot_time == 0
					@enemybulletArray.push(Bullet.new(@gosu,enemy.x  + 20,enemy.y + 30,0))
				end
			end  
	end
	
	def delet_array
		if @bulletArray.size > 150
		 puts "deleted array stuff"
		end
		if @enemybulletArray == 150
		
		end
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
		player_hit
		enemy_shoots
		delet_array
		@enemyArray.each{|x| x.move}
		@bulletArray.each{|x| x.move}
		@enemybulletArray.each{|x| x.enemy_move}
		@moneyArray.each{|x| x.move}
	end
	
	def draw
		@ship.draw
		@enemyArray.each {|x| x.draw}
		@bulletArray.each {|x| x.draw}
		@enemybulletArray.each{|x| x.draw}
		@moneyArray.each{|x| x.draw}
		@font.draw("$",10, 10,WritingLayer, 1.0, 1.0, 0xffffffff)
		@font.draw(@money,30, 10,WritingLayer, 1.0, 1.0, 0xffffffff)
	end
	def bullet_select
		if @bullet_id < 6
			@bullet_id += 1;
		else
			@bullet_id = 0
		end
	end 
	
	def button_down(id)
		case id
		when  Gosu::KbTab
			bullet_select
		when  Gosu::KbSpace
			if @bullet_id != 2
				@bulletArray.push(Bullet.new(@gosu,@ship.x  + 30,@ship.y + 10,@bullet_id))
			end
			if @bullet_id == 2
				@bulletArray.push(Bullet.new(@gosu,@ship.x  + 5,@ship.y + 10,@bullet_id))
				@bulletArray.push(Bullet.new(@gosu,@ship.x + 55,@ship.y + 10,@bullet_id))
			end
			if @bullet_id == 6
				@bulletArray.push(Left_bullet.new(@gosu,@ship.x  + 30,@ship.y + 10,@bullet_id))
				@bulletArray.push(Right_bullet.new(@gosu,@ship.x  + 30,@ship.y + 10,@bullet_id))
				@bulletArray.push(Left_bullet_two.new(@gosu,@ship.x  + 5,@ship.y + 10,@bullet_id))
				@bulletArray.push(Right_bullet_two.new(@gosu,@ship.x + 55,@ship.y + 10,@bullet_id))
			end
		end
		
	end
	
end


