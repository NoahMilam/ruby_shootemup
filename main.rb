require 'rubygems'
require 'gosu'
require 'chingu'
require './player'
require './enemy'
require './bullet'
require './money'
#states
require './state'
require './intro'
require './start_menu'
require './phX'
require './password'

#game window
require './window'

# layers
BackgroundLayer,WritingLayer, StageLayer,UILayer =* 1..1000
Window.new.show