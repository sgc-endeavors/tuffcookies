require 'spec_helper'

describe Player do
  it { should belong_to(:game) }
 
	it "has a valid factory" do
 		FactoryGirl.create(:player).should be_valid
 	end

 #CREATE 4 GAME PLAYERS - creates 1 human player and 3 non-human players for the game
 	it { Player.should respond_to(:create_4_game_players) }

	describe "#create_4_game_players" do
 		
 			let(:user) { FactoryGirl.create(:user) }
 			let(:game) { FactoryGirl.create(:game, user_id: user.id) }
 		

 		it "should create 4 players for the game" do
 			Player.create_4_game_players(game.id)
 			Player.where(game_id: game.id).count.should == 4
 		end
	end


end
