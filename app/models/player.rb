class Player < ActiveRecord::Base
  attr_accessible :identifier, :name

 def self.columns() 
		@columns ||= []
	end
 
  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end
  
  column :identifier, :integer
  column :name, :string
  

  belongs_to :game




end
