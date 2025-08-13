FactoryBot.define do
  factory :item do
    item { '商品' }
    description { '商品説明' }
    category_id { 2 }
    condition_id { 2 }
    bearer_id { 2 }
    ship_from_address_id { 2 }
    shipping_time_id { 2 }
    price { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open('spec/images/Test.png'),
        filename: 'Test.png'
      )
    end
  end
end
