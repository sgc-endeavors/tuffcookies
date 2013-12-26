class CardsController < ApplicationController

	def new
		create
	end

	def create
		deck_id = params[:deck_id]
		Card.generate_numeric_cards(deck_id)
		Card.generate_action_cards(deck_id)
		redirect_to game_path(Deck.find(deck_id).game.id)  
	end

end
