require 'spec_helper'

describe User do
	it {should have_many(:games) }

	it "has a valid factory" do
 		FactoryGirl.create(:user).should be_valid
 	end
end
