class Player < ActiveRecord::Base
  attr_accessible :game_id, :name, :player_correct_guesses, :player_order
  belongs_to :game
end
