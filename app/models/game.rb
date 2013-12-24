class Game < ActiveRecord::Base
	attr_accessible :direction, :consecutive_correct_guesses, :user_id
 	has_many :players
 	has_one :deck
 	belongs_to :user
end	