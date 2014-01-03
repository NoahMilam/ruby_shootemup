class State
  
  
  def initialize(gosu)
    @gosu = gosu
    state_initialize
  end
  
  
  # this should be over-ridden in the sub classes as the initializer
  def state_initialize
  end
  
  
  # these are just here to stop any errors happening if sub classes
  # don't have these methods defined
  def update
  end
  
  
  def draw
  end
  
  
  def button_down(id)
  end
  
  
  def button_up(id)
  end
end