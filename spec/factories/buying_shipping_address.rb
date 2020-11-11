FactoryBot.define do
  factory :buying_shipping_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {'444-4444'}
    prefecture_id { 3 }
    city { '東京都' }
    house_number { '新宿区1-1' }
    building { '東京ハイツ' }
    phone_number { '00000000000' }
  end
end