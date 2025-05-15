FactoryBot.define do
  factory :address do
    post_code { 'MyString' }
    prefecture_id { 1 }
    city { 'MyString' }
    address_line { 'MyString' }
    building_name { 'MyString' }
    phone_number { 'MyString' }
    order { nil }
  end
end
