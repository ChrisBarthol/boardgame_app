class GamesController < ApplicationController
  def index
  
  end

  def api_index
    @games = Game.all
    render json: @games
  end
end
