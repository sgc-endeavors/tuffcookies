require 'spec_helper'

describe Deck do
	it { should belong_to(:game) }
	it { should have_many(:cards) }

	it "has a valid factory" do
 		FactoryGirl.create(:deck).should be_valid
 	end

 	#SHUFFLE DECK
 	it { should respond_to(:shuffle_deck) }

 	describe "#shuffle_deck" do
 		let(:deck) { FactoryGirl.create(:deck) }
 		before(:each) do
 			5.times { FactoryGirl.create(:card, deck_id: deck.id) }
 		end
 		it "shuffles the cards for the deck by assigning an 'order_in_deck' to the cards" do
			deck.shuffle_deck
			count = 0
			cards = Card.where(deck_id: deck.id)
			cards.each { |card | count += card.order_in_deck }
			count.should == (cards.count * (cards.count + 1))/2
		end
 	end

 	#FLIP CARD
 	it { should respond_to(:flip_card) }

 	describe "#flip_card" do
		let(:deck) { FactoryGirl.create(:deck) }
 		before(:each) do
 			@already_played_card = FactoryGirl.create(:card, owner: 1, status: "in_play", deck_id: deck.id, order_in_deck: 1)
 			@first_card =  FactoryGirl.create(:card, deck_id: deck.id, order_in_deck: 2)
 			@second_card =  FactoryGirl.create(:card, deck_id: deck.id, order_in_deck: 3) 
 		end 		

 		it "selects the first unplayed card from the top of the deck" do
 			deck.flip_card
 			Card.where(deck_id: deck.id).where(order_in_deck: 2).first.status.should == "in_play"
 		end
 	end

end
