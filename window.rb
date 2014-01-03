class Window <Gosu::Window
	
	attr_accessor :current_state
    
	STATE = {:main  => "StartMenu.new(self)",
			:game   => "GamePlay.new(self)"}
  
	def initialize
		super 800, 600, false
		#puts STATE[:gameWindow]
		self.current_state = eval(STATE[:game])
				
	end
  
  
	def update
		self.current_state.update
	end
  
  
	def draw 
	 self.current_state.draw
	end
end
