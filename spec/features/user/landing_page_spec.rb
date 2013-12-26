require 'spec_helper'

describe "users#landing_page" do
	before(:each) { visit root_path }
	
	subject { page }

	it { should have_link("Play") }
	it { should have_link("My Record") }
	it { should have_link("Rules") }
	it { should have_link("About") }

	context "the visitor has logged in" do
		let(:new_user) { FactoryGirl.create(:user) }

		before(:each) do 
			click_on("Login")
			fill_in "Email", with: new_user.email
			fill_in "Password", with: new_user.password
			click_on("Sign in")
		end

		context "the user presses 'Play'" do
			before(:each) { click_on("Play") }

			it "triggers the creation of a new game for the user" do
				Game.last.user_id.should == new_user.id
			end

			it "triggers the creation of the user as a player for the game" do
				Player.first.name.should == new_user.player_name
				Player.first.game_id.should == Game.last.id
			end

			it "triggers the creation of 4 total players for the game" do
				Player.where(game_id: Game.last.id).count.should == 4
			end

			it "triggers the creation of a deck for the game" do
				Deck.last.game_id.should == Game.last.id
			end

			it "triggers the creation of cards for the deck for the game" do
				Card.last.deck_id.should == Deck.last.id
			end

			it "triggers the creation of 52 numeric cards for the deck for the game" do
				Card.where(deck_id: Deck.last.id).where(card_type: "numeric").count.should == 52
			end

			it "triggers the creation of 2 reverse cards for the deck for the game" do
				Card.where(deck_id: Deck.last.id).where(name: "reverse").count.should == 2
			end

			# it "shuffles the cards for the deck by assigning an 'order_in_deck' to the cards" do
			# 	new_deck
			# 	count = 0
			# 	cards = Card.where(deck_id: deck_id)
			# 	cards.each { |card | count += card.order_in_deck }
			# 	count.should == 1485
			# end

			it "routes the user to the game's show path" do
				current_path.should == game_path(Game.last.id)
			end



		end
		context "the user presses 'My Record'" do
			before(:each) { click_on("My Record") }
			it "routes the user to the user's show page" do				
				current_path.should == user_path(new_user.id)
			end
		end
	end
	
	context "the visitor has not logged in" do
		context "the visitor presses 'Play'" do
			before(:each) { click_on("Play") }
			it "redirects the visitor to the login/signup page" do
				current_path.should == new_user_session_path
			end
		end

		context "the visitor presses 'My Record'" do
			before(:each) { click_on("My Record") }
			it "redirects the visitor to the login/signup page" do				
				current_path.should == new_user_session_path
			end
		end
	end
end