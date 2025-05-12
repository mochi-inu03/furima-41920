FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '岐阜市' }
    address_line { '鶉1-1-1' }
    building_name { '日の丸ビル101' }
    phone_number { '09012345678' }
    user_id { 1 }
    item_id { 1 }
  end
end
