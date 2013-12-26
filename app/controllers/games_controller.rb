class GamesController < ApplicationController
  before_filter :authenticate_user!

  def show
    #need to test
    @user = current_user
    @game = Game.where(user_id: @user.id).last
    @deck = Deck.where(game_id: @game.id).first
    @card = Card.where(deck_id: @deck.id).first
    @players = Player.where(game_id: @game.id)
  end

  def update
  end

  def new
    create
  end


  def destroy
  end

  def create
    new_game = Game.new
    new_game.user_id = current_user.id
    new_game.direction = "ascending"
    new_game.consecutive_correct_guesses = 0
    new_game.save!
    redirect_to new_player_path(game_id: new_game.id)  
  end

  def edit
  
  end
end
