require 'spec_helper'

describe Player do
  it { should belong_to(:game) }
 
 it "has a valid factory" do
 	FactoryGirl.create(:player).should be_valid
 end


end
