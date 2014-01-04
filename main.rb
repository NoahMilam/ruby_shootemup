require 'rubygems'
require 'gosu'


require './player'
require './enemy'
require './bullet'

#states
require './state'
require './start_menu'
require './phX'

#game window
require './window'

# layers
BackgroundLayer, StageLayer =* 1..1000
Window.new.show