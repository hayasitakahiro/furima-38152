# テーブル設計

## users テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false, unique: true, index:true |
| encrypted_password     | string | null: false |
| first_name             | string | null: false |
| family_name            | string | null: false |
| first_name_kana        | string | null: false |
| family_name_kana       | string | null: false |
| birth_date             | date   | null: false |




### Association
 has_many :items


## items テーブル


| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| product_name           | string | null: false |
| category_id            | integer | null: false |
| product_condition_id   | integer | null: false |
| product_burden_id      | integer | null: false |
| area                   | string | null: false |
| shipping_day_id        | integer| null: false |
| price                  | integer| null: false |
| user                   | references ｜ foreign_key: true |



### Association
belongs_to :user
has_one : shipping_infomation



## shipping_infomation  テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| post                   |string  | null: false |
| city                   | string | null: false |
| address                | string | null: false |
| building_name          | string |
| phone_number           | string | null: false |
| purchase_record       |references｜foreign_key: true|

### Association

belongs_to :item
has_one :purchase_records






##　purchase_records テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| user                　　| references　|null: false, foreign_key: true 
| item                　　|　references | null: false foreign_key: true|


### Association

 belongs_to :shipping infomation