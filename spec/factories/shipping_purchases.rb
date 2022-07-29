FactoryBot.define do
  factory :shipping_purchase do
    postal_code         { '123-4567' }
    city                { ' 市区町村' }
    address             { '1番地' }
    phone_number        { '09012345678' }
    prefecture_id       {2}
    building_name       {'ああああ'}
    token               {'1'}
    user_id             {'2'}
    item_id             {'2'}
  end
end

