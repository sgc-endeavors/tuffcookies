class Deck < ActiveRecord::Base
  attr_accessible :game_id
  belongs_to :game
  has_many :cards

  def shuffle_deck
	  array = []
	 	for i in 1..Card.where(deck_id: self.id).count
			array << i
		end
		array.shuffle!

		cards =  Card.where(deck_id: self.id).all
		cards.each do |card|
			card.order_in_deck = array.shift
			card.save!
		end

  end

  def flip_card
  	card_to_flip = Card.where(deck_id: self.id).where(status: "in_deck").order(:order_in_deck).first
  	card_to_flip.status = "in_play"
  	card_to_flip.save!
  end

end
