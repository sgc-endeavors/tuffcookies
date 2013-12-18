class GamesController < ApplicationController
  def show
  end

  def update
  end

  def new
    @new_game = Game.new
    render :new
  end

  def destroy
  end

  def create
    game = Game.new
    # game.identifier = 999
    # game.direction = "ascending"
    # game.current_correct_guesses = 0
    #game.save!
    
    #redirect_to new_player_path(params[:player_name])
    redirect_to :controller=>'players', :action => 'new', :player => params[:player_name], :game_id => game.identifier

  end

  def edit
  end
end
