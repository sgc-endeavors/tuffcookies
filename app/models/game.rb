class Game < ActiveRecord::Base
	attr_accessible :direction, :consecutive_correct_guesses
 	has_many :players
 	has_one :deck

end