class PlayersController < ApplicationController
  before_filter :authenticate_user!

  def show
  end

  def update
  end

  def new
    create
  end

  def destroy
  end

  def index
  end

  def create
    game_id = params[:game_id]
    new_player = Player.new
    new_player.name = current_user.player_name
    new_player.game_id = game_id
    new_player.player_correct_guesses = 0
    new_player.player_order = 1
    new_player.save!
    redirect_to new_deck_path(game_id: game_id)
  end

  def edit
  end
end
