FactoryBot.define do
  factory :item do
    item_name        {Faker::Lorem.word}
    description      {Faker::Lorem.sentence}
    category_id      {Faker::Number.between(from: 2, to: 11)}
    status_id        {Faker::Number.between(from: 2, to: 7)}
    cover_expense_id {Faker::Number.between(from: 2, to: 3)}
    area_id          {Faker::Number.between(from: 2, to: 48)}
    delivery_time_id {Faker::Number.between(from: 2, to: 4)}
    price            {Faker::Number.between(from: 300, to: 9999999)}
    association :user
  end
end
