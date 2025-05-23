FactoryBot.define do
  factory :item do
    item_name { 'Test Item' }
    item_description { 'This is a description of the item.' }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_burden_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    price { 600 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
