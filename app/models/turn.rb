class Turn < ActiveRecord::Base
  attr_accessible :card_in_play, :flipped_card, :game_id, :player_guess, :player_order_number
end
