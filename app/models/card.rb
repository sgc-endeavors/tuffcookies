class Card < ActiveRecord::Base
  attr_accessible :card_type, :deck_id, :name, :order_in_deck, :owner, :status
  belongs_to :deck

  def self.create_numeric_cards(deck_id)
  	for i in 1..13
			for each in 1..4
				Card.create_and_save_card("#{i}", "numeric", deck_id)
				# new_card = Card.new
				# new_card.name = "#{i}"
				# new_card.card_type = "numeric"
				# new_card.status = "in_deck"
				# new_card.owner = 0
				# new_card.deck_id = deck_id
				# new_card.save!
			end
		end
  end

  def self.create_action_cards(deck_id)
  	for i in 1..2
			Card.create_and_save_card("reverse", "action_card", deck_id)
			# new_action_card = Card.new
			# new_action_card.name = "reverse"
			# new_action_card.card_type = "action_card"
			# new_action_card.status = "in_deck"
			# new_action_card.owner = 0
			# new_action_card.deck_id = deck_id
			# new_action_card.save!
 		end
  end

  def self.create_and_save_card(name, card_type, deck_id)
  	card = Card.new
  	card.name = name
  	card.card_type = card_type
  	card.status = "in_deck"
  	card.owner = 0
  	card.deck_id = deck_id
  	card.save! 
  end


end
