require 'spec_helper'

describe "new_turn#landing_page" do

	# let(:new_user) { FactoryGirl.create(:user) }
	#let(:card) {FactoryGirl.create(:card) }
	before(:each) do 
		user = FactoryGirl.create(:user)
		@game = FactoryGirl.create(:game, user_id: user.id)
		deck = FactoryGirl.create(:deck, game_id: @game.id)
		card = FactoryGirl.create(:card, deck_id: deck.id)
		login_user(user)
		visit new_turn_path(@game.id)
	end

	subject { page }

	# it { should have_content("Tuff Cookies") }
	# it { should have_content("Card In Play") }
	# it { should have_content("Players:") }
	# it { should have_content("DeckID : #{Deck.last.id}") }
	it { should have_content("GameID : #{@game.id}") }
	#it { should have_content("Username : #{User.last.player_name}") }
	# it { should have_button("Higher") }
	# it { should have_button("Lower") }
	# it { should have_button("Sweep") }

end