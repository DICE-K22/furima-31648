FactoryBot.define do
  factory :product do
    name { Faker::Food.dish }
    description { Faker::TvShows::StrangerThings.quote }
    category_id { Faker::Number.between(from: 2, to: 10) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    burden_id { Faker::Number.between(from: 2, to: 3) }
    shipping_area_id { Faker::Number.between(from: 2, to: 48) }
    shipping_day_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
