class Card < ActiveRecord::Base
  attr_accessible :card_type, :deck_id, :name, :order_in_deck, :owner, :status
  belongs_to :deck

  def self.generate_numeric_cards(deck_id)
  	for i in 1..13
			for each in 1..4
				Card.create_and_save_card("#{i}", "numeric", deck_id)
			end
		end
  end

  def self.generate_action_cards(deck_id)
  	for i in 1..2
			Card.create_and_save_card("reverse", "action_card", deck_id)
 		end
  end

  def self.create_and_save_card(name, card_type, deck_id)
  	card = Card.new
  	card.name = name
  	card.card_type = card_type
  	card.status = "in_deck"
  	card.owner = 0
  	card.order_in_deck = 0
  	card.deck_id = deck_id
  	card.save! 
  end
end
