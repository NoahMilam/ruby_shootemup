class StartMenu < State

  def state_initialize
    @selected_option = :game
    @images = {
        :title => Gosu::Image.new(@gosu, 'title.png', false),
    }
    @font = Gosu::Font.new(@gosu, "Helvetica Bold", 72)
    @selected_color = 0xffff0000
    @unselected_color = 0xffffffff

  end

  def update

  end

  def draw
  

    play_text = @unselected_color
    password_text = @unselected_color

    if @selected_option == :game
      play_text = @selected_color
    else
      password_text = @selected_color
    end
	 
    @font.draw("Play", 100, 200, UILayer, 1.0, 1.0, play_text)
    @font.draw("Password", 100, 300, UILayer, 1.0, 1.0, password_text)
  end


  def button_down(id)
    if id == Gosu::KbEscape
      @gosu.close
    end

    if id == Gosu::KbDown
      @selected_option = :password
    end

    if id == Gosu::KbUp
      @selected_option = :game
    end

    if id == Gosu::KbEnter || id == Gosu::KbReturn || id == Gosu:: KbSpace
      @gosu.next_state(@selected_option)
    end

  end
end
