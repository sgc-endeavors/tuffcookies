# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	player_name "Joe"
  	email "joe.smith@gmail.com"
  	password "buttercup"
  	password_confirmation "buttercup"
  end
end
