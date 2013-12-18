class Game < ActiveRecord::Base
  
  attr_accessible :identifier, :direction, :current_correct_guesses

	def self.columns() 
		@columns ||= []
	end
 
  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

 #  def initialize
 #  	identifier = 999
 #  	direction = "ascending"
 #  	current_correct_guesses = 0
	# end
  
  column :identifier, :integer
  column :direction, :string
  column :current_correct_guesses, :integer

  has_many :players
end