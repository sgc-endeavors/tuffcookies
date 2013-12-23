require 'spec_helper'

describe Deck do
	it { should belong_to(:game) }
	it { should have_many(:cards) }

	 it "has a valid factory" do
 	FactoryGirl.create(:deck).should be_valid
 end
end
