# テーブル設計

## users テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false, unique: true, |
| encrypted_password     | string | null: false |
| first_name             | string | null: false |
| family_name            | string | null: false |
| first_name_kana        | string | null: false |
| family_name_kana       | string | null: false |
| birth_date             | date   | null: false |




### Association
 has_many :items
 has_many :purchase_records


## items テーブル


| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| product_name           | string | null: false |
| description_of_item    | text |  null: false |
| category_id            | integer | null: false |
| product_condition_id   | integer | null: false |
| prefecture_id          | integer | null: false |
| burden_of_shipping_charge_id      | integer | null: false |
| shipping_day_id        | integer| null: false |
| price                  | integer| null: false |
| user                   | references ｜ null: false,foreign_key: true |

### Association
belongs_to :user
has_one :purchase_record





## shipping_infomations  テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| postal_code            |string  | null: false |
| city                   | string | null: false |
| address                | string | null: false |
| building_name          | string |
| phone_number           | string | null: false |
| purchase_record        |references｜null: false,foreign_key: true |
| prefecture_id         | integer |  null: false |
### Association


belongs_to :purchase_record






##　purchase_records テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| user                   | references |null: false, foreign_key: true 
| item                   | references | null: false, foreign_key: true|


### Association

 has_one :shipping_infomation
 belongs_to :user
 belongs_to :item
