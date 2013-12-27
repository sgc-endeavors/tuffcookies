class TurnsController < ApplicationController
  def show
  end

  def update
  end

  def new
    @user = current_user
    @game = Game.where(user_id: @user.id).last
    @deck = Deck.where(game_id: @game.id).first
    @card = Card.where(deck_id: @deck.id).where(order_in_deck: 1).first
    # @players = Player.where(game_id: @game.id)
  end

  def destroy
  end

  def create
  end

  def edit
  end
end
