require 'spec_helper'

describe Card do
  it { should belong_to(:deck) }

  it "has a valid factory" do
 		FactoryGirl.create(:card).should be_valid
 	end

 	#GENERATE NUMERIC CARDS - creates multiple instances of numbered cards for the deck
 	it { Card.should respond_to(:generate_numeric_cards) }
 	
 	describe "#generate_numeric_cards" do
 		let(:deck) { FactoryGirl.create(:deck) }
 		it "creates 52 numbered cards for the deck" do
 			Card.generate_numeric_cards(deck.id)
 			Card.where(deck_id: deck.id).count.should == 52
 		end
 	end

 	#GENERATE ACTION CARDS - creates  multiple instances of action cards for the deck
 	it { Card.should respond_to(:generate_action_cards) }

 	describe "#generate_action_cards" do
 		let(:deck) { FactoryGirl.create(:deck) }
 		it "creates 2 'reverse' action cards for the deck" do
 			Card.generate_action_cards(deck.id)
 			Card.where(deck_id: deck.id).where(name: "reverse").count.should == 2
 		end
 	end

 	#CREATE AND SAVE CARD - creates a specified card and adds it to the d'base
 	it { Card.should respond_to(:create_and_save_card) }
end
