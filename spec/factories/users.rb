FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
    first_name            { '太郎' }
    last_name             { '山田' }
    read_first            { 'タロウ' }
    read_last             { 'ヤマダ' }
    birth_day             { '1990-01-01' }
  end
end
