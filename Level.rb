class Level
	def initialize(level,enemyCount,pattern)
		@level_number = level
		@enemy_count = enemyCount
		@pattern = pattern
	
	end

	def get_level
		puts @level_number
	end

end