# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :turn do
    game_id 1
    player_guess "MyString"
    card_in_play "MyString"
    flipped_card "MyString"
    player_order_number 1
  end
end
