class Intro < State

	def state_initialize
		@intro_pic = Gosu::Image.new(@gosu,'p00psmile.png', false)     
 		
	end
	
	def update
		
	end
	
	def draw
			@intro_pic.draw(0, 0,  UILayer)
			
	end
  
  
  
  def button_down(id)
    
   if id == Gosu::KbEscape
      @gosu.close
    end
	 
	if id == Gosu::KbSpace
      @gosu.next_state(:main)
    end
    
  end


end