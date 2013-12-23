require 'spec_helper'

describe Game do
 it { should have_many(:players)}
 it { should have_one(:deck) }

 it "has a valid factory" do
 	FactoryGirl.create(:game).should be_valid
 end


end
