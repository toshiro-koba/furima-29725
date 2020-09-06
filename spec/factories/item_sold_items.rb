FactoryBot.define do
  factory :item_sold_item do
    postal_code { '123-4567' }
    prefectures_id { Faker::Number.between(from: 2, to: 48) }
    city { '横浜市' }
    address { '青山' }
    building_name { '柳ビル' }
    phone_number { Faker::Number.leading_zero_number(digits: 11) }
    token { "tok_#{Faker::Alphanumeric.alphanumeric(number: 28)}" }
  end
end
