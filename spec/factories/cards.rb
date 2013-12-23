# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :card do
    deck_id 1
    name "MyString"
    card_type "numeric"
    status "in_deck"
    owner 0
    order_in_deck 1
  end
end
