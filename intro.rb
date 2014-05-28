class Intro < State

	def state_initialize
		@intro_pic = Gosu::Image.new(@gosu,'p00psmile.png', false)  
		@stay_rad = Gosu::Image.new(@gosu,'p00psmile.png', false) 
 		@screen = 0 
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
		@intro_pic = Gosu::Image.new(@gosu,'p00psmile.png', false) 
		if (@screen  == 1)
			@gosu.next_state(:main)
		end
		@screen += 1
    end
    
  end


end