# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	player_name "Joe"
  	sequence(:email) { |i|  "joe.smith#{i}@gmail.com" }
  	password "buttercup"
  	password_confirmation "buttercup"
  end
end
