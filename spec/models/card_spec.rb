require 'spec_helper'

describe Card do
  it { should belong_to(:deck) }

  it "has a valid factory" do
 		FactoryGirl.create(:card).should be_valid
 	end

 	#CREATE NUMERIC CARDS - creates numbered cards for the deck
 	it { Card.should respond_to(:create_numeric_cards) }
 	
 	describe "#create_numeric_cards" do
 		let(:deck) { FactoryGirl.create(:deck) }
 		it "creates 52 numbered cards for the deck" do
 			Card.create_numeric_cards(deck.id)
 			Card.where(deck_id: deck.id).count.should == 52
 		end
 	end

 	#CREATE ACTION CARDS - creates action cards for the deck
 	it { Card.should respond_to(:create_action_cards) }

 	describe "#create_action_cards" do
 		let(:deck) { FactoryGirl.create(:deck) }
 		it "creates 2 'reverse' action cards for the deck" do
 			Card.create_action_cards(deck.id)
 			Card.where(deck_id: deck.id).where(name: "reverse").count.should == 2
 		end
 	end

end
