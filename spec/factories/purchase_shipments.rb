FactoryBot.define do
  factory :purchase_shipment do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    area_id { 1 }
    municipalities { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    telephone_number { '07012345678' }

  end
end
