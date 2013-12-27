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
			login_user(new_user)
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

			context "deck has not yet been shuffled" do
				it "shuffles the cards for the deck by assigning an 'order_in_deck' to the cards" do
					deck = Deck.last
					count = 0
					cards = Card.where(deck_id: deck.id)
					cards.each { |card | count += card.order_in_deck }
					count.should == (cards.count * (cards.count + 1))/2
				end
			end

			context "deck has been shuffled and the next card in deck is flipped" do
				let(:deck) { FactoryGirl.create(:deck) }
				before(:each) do
					FactoryGirl.create(:card, name: "Card 1", deck_id: deck.id, order_in_deck: 1)
					50.times { FactoryGirl.create(:card, deck_id: deck.id) }
				end
				
				it "does not reshuffle the deck" do
					visit edit_deck_path(deck.id)
					Card.where(deck_id: deck.id).where(name: "Card 1").first.order_in_deck.should == 1
				end
			end

			it "flips the next card in the deck" do
				deck = Deck.last
				Card.where(deck_id: deck.id).where(status: "in_deck").order(:order_in_deck).first.should == Card.where(deck_id: deck.id).where(order_in_deck: 2).first
			end

			it "routes the user to the game's show path" do
				current_path.should == new_turn_path(Game.last.id)
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