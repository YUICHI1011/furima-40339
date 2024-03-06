FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    category_id { FactoryBot.create(:category).id }
    status_id { FactoryBot.create(:status).id }
    price { Faker::Commerce.price(range: 300..9999999) }
    shipping_fee_id { FactoryBot.create(:shipping_fee).id }
    prefecture_id { FactoryBot.create(:prefecture).id }
    shipping_day_id { FactoryBot.create(:shipping_day).id }
    association :user

    after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end