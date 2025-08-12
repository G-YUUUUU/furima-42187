FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { 'test@example.com' }
    password              { 'AbCd1234' }
    password_confirmation { password }
    last_name              { '山田' }
    first_name             { '隆太郎' }
    last_name_kana         { 'ヤマダ' }
    first_name_kana        { 'リクタロウ' }
    birth_date             { Faker::Date.between(from: '1930-01-01', to: '2020-12-31') }

    trait :another_user do
      nickname              { Faker::Name.name }
      email                 { 'Test@example.com' }
      password              { 'test1111' }
      password_confirmation { password }
      last_name              { '鈴木' }
      first_name             { '太郎' }
      last_name_kana         { 'スズキ' }
      first_name_kana        { 'タロウ' }
      birth_date             { Faker::Date.between(from: '1930-01-01', to: '2020-12-31') }
    end
  end
end
