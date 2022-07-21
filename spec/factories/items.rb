FactoryBot.define do
  factory :item do
    product_name { 'hoge' }
    description_of_item             { '商品の説明' }
    category_id                     { 2 }
    product_condition_id            { 2 }
    prefecture_id                   { 2 }
    burden_of_shipping_charge_id    { 2 }
    shipping_day_id                 { 2 }
    price                           { '1111' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
