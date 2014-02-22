class Window <Gosu::Window
	
	attr_accessor :current_state
    
	STATE = {:intro => "Intro.new(self)",
			:main  => "StartMenu.new(self)",
			:game   => "GamePlay.new(self)",
			:password => "Password.new(self)"}
  
	def initialize
		super 800, 600, false
		self.current_state = eval(STATE[:intro])
		 @background_image = Gosu::Image.new(self,'outerspace.png', false)
		  self.caption = "p00psmile"
	end
  
  
	def update
		self.current_state.update
	end
  
  
	def draw 
	 self.current_state.draw
	 @background_image.draw(0, 0, BackgroundLayer)
	end
	
	def button_down(id)
		self.current_state.button_down(id)
	end
	
	def button_up(id)
    #self.current_state.button_up(id)
  end
   def next_state(state)
    self.current_state = eval(STATE[state])
  
  end
end
