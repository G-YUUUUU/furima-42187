FactoryBot.define do
  factory :purchased_record_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '市区町村' }
    house_number { '番地' }
    building { '建物名' }
    phone_number { '08011111111' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
