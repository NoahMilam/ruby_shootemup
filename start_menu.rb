class StartMenu < State

	def state_initialize
    	@options = [:game,:password]
		@play_choice = 1
		@password_choice =  2
		 @images = [
        Gosu::Image.new(@gosu,'play.png', false),
        Gosu::Image.new(@gosu,'play_selected.png', false),
        Gosu::Image.new(@gosu,'password.png', false),
		Gosu::Image.new(@gosu,'password_selected.png', false),
		Gosu::Image.new(@gosu,'title.png', false),
      ]

		
	end
	
	def update
		
	end
	
	def draw
		@images[4].draw(100, 50, UILayer)
		@images[@play_choice].draw(200, 200, UILayer)
		@images[@password_choice].draw(200, 300, UILayer)
	end
  
  
  
  def button_down(id)
    
    if id == Gosu::KbEscape
      @gosu.close
    end
    
    if id == Gosu::KbDown
	@play_choice = 0
		@password_choice =  3
		
    end
    
    if id == Gosu::KbUp
		@play_choice = 1
		@password_choice =  2
    end
    
    if id == Gosu::KbEnter || id == Gosu::KbReturn
		if @play_choice == 1
			@gosu.next_state(@options[0])
		end
		if @play_choice == 0
			@gosu.next_state(@options[1])
		end
    
    end
    
  end
end
