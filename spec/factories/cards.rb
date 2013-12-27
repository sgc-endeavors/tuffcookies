# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :card do
    #deck_id 1
    association :deck
    sequence(:name) { |i| "Numbered_Card-#{i}" }
    card_type "numeric"
    status "in_deck"
    owner 0
    order_in_deck 0
  end
end
