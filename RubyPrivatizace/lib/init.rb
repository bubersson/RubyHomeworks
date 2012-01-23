require 'rubygems'

require 'yaml'
require './tools/object'
require './tools/array'
#require 'enumerator'
require 'pp'
require 'gosu'
require './engine/game_window'
require './engine/state_machine'
require './engine/init_state'
require './engine/play_state'

game = GameWindow.new
game.show