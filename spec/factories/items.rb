FactoryBot.define do
  factory :item do
 
 image                           {}
 product_name                    {"hoge"}
 description_of_item             {"商品の説明"}
 category_id                     {"メンズ"}
 product_condition_id            {"新品"}
 prefecture_id                   {"広島"}
 burden_of_shipping_charge_id    {"着払い"}
 shipping_day_id                 {"ああああ"}
 price                           {"111"}
  end
end
