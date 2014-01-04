class Window <Gosu::Window
	
	attr_accessor :current_state
    
	STATE = {:main  => "StartMenu.new(self)",
			:game   => "GamePlay.new(self)"}
  
	def initialize
		super 800, 600, false
		self.current_state = eval(STATE[:game])
		 @background_image = Gosu::Image.new(self,'space.png', false)		
	end
  
  
	def update
		self.current_state.update
	end
  
  
	def draw 
	 self.current_state.draw
	 @background_image.draw(0, 0, BackgroundLayer)
	end
	
	def button_down(id)
		puts "button down in window.rb"
		self.current_state.button_down(id)
	end
	
	def button_up(id)
    #self.current_state.button_up(id)
  end
end
