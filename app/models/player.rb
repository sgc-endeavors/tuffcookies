class Player < ActiveRecord::Base
  attr_accessible :game_id, :name, :player_correct_guesses, :player_order
  belongs_to :game

 	def self.create_4_game_players(game_id)
    player_names = [Game.find(game_id).user.player_name, "Noah", "Anne", "George"]
    player_names.each do |player_name|
      new_player = Player.new
      new_player.name = player_name
      new_player.game_id = game_id
      new_player.player_correct_guesses = 0
      new_player.player_order = player_names.index(player_name) + 1
      new_player.save!
    end  
  end


end
