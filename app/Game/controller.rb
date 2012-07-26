require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

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
    @game = ::Rho.get_app.game
    @game.set_level LEVEL1
    @level = @game.get_level
    render
  end

  def play
    @game = ::Rho.get_app.game
    @game.sokoban_move(@params['direction'].to_sym) if @params['direction']
    @level = @game.get_level
    render :action=>:index
  end

end
