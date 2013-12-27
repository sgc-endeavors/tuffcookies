class CardsController < ApplicationController

	def new
		create
	end

	def create
		deck_id = params[:deck_id]
		Card.generate_numeric_cards(deck_id)
		Card.generate_action_cards(deck_id)
		redirect_to edit_deck_path(deck_id)  
	end

end
