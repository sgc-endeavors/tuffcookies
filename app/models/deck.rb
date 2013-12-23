class Deck < ActiveRecord::Base
  attr_accessible :game_id
  belongs_to :game
  has_many :cards
end
