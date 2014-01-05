class Password < State
	
	def initialize(gosu)
	super (gosu)
	@gosu = gosu
	@image = Gosu::Image.new(@gosu,'nopasswordyest.png', false)
	end
	
	def update
	end
	
	def draw
		@image.draw(100, 200, UILayer)
	end
	
	def button_down(id)
		if id == Gosu::KbEscape
			@gosu.close
		end
		if id == Gosu::KbEnter || id == Gosu::KbReturn
			@gosu.next_state(:main)
		end   
	end
end