require 'spec_helper'


describe "players#new view"  do
	

	before(:each) do
		visit root_path
	end

	let(:new_player) { FactoryGirl.create(:player) }
	
	subject { page }

	it { should have_content("Enter name to play:")}

	it "should save the new playe"
	click_on("Login")



end