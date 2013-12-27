class DecksController < ApplicationController

	def new
		create
	end

	def create
		game_id = params[:game_id]
		new_deck = Deck.new
		new_deck.game_id = game_id
		new_deck.save!
		redirect_to new_card_path(deck_id: new_deck.id)
	end

	def edit
		update
	end

	def update
		deck = Deck.find(params[:id])
		
		if Card.where(deck_id: deck.id).first.order_in_deck == 0
			deck.shuffle_deck
		end

		deck.flip_card

		redirect_to new_turn_path(Deck.find(params[:id]).game.id)
	end

end
