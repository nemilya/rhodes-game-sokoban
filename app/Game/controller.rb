require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

require 'lib/game_sokoban'

LEVEL1 =  '
 #########
 #  #   .#
 #@$ $   #
 # $ ##..#
 #   #####
 #########'

class GameController < Rho::RhoController
  include BrowserHelper
  
  def index
    @game = GameSokoban.new
    @game.set_level @params['level'] || LEVEL1
    @game.sokoban_move(@params['direction'].to_sym) if @params['direction']
    @level = @game.get_level
    render
  end

end
