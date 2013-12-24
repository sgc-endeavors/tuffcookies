# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    association :user
    direction "ascending"
    consecutive_correct_guesses 0
  end
end
