require 'spec_helper'

describe Card do
  it { should belong_to(:deck) }

   it "has a valid factory" do
 	FactoryGirl.create(:card).should be_valid
 end
end
