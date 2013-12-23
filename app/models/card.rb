class Card < ActiveRecord::Base
  attr_accessible :card_type, :deck_id, :name, :order_in_deck, :owner, :status
  belongs_to :deck
end
