# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    name "FactoryPlayer"
    association :game
    #game_id 1
    player_order 1
    player_correct_guesses 0
  end
end
