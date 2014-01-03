class StartMenu < State

	def state_initialize
		puts "in start menu"
    	#@options = [:Play, :Options]
		
	end
	
	def update
		
	end
	
	def draw
		#@font.draw("SHOOT'EM", 240, 100, 50, 2.8, 2.8, 0xffffffff)	
	end
  
  
  
  def button_down(id)
    
    if id == Gosu::KbEscape
      @gosu.close
    end
    
    if id == Gosu::KbDown
    
    end
    
    if id == Gosu::KbUp
    
    end
    
    if id == Gosu::KbEnter || id == Gosu::KbReturn
    
    end
    
  end
end
