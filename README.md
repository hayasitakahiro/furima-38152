# テーブル設計

## users テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false |
| password               | string | null: false |
| first_name             | string | null: false |
| family_name            | string | null: false |
| first_name_kana        | string | null: false |
| family_name_kana       | string | null: false |
| birth_date             | date   | null: false |
|                        |        |             |
|                        |        |             |
|                        |        |             |
|                        |        |             |


### Association
 has_many :items
 has_many :shipping infomations
 has_one  :purchase_record

## items テーブル


| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| image                  | string | null: false |
| product_name           | string | null: false |
| category               | string | null: false |
| product_condition      | string | null: false |
| product_burden         | string | null: false |
| area                   | string | null: false |
| days                   | integer| null: false |
| price                  | integer| null: false |
|                        |        |             |
|                        |        |             |
|                        |        |             |
|                        |        |             |


### Association
belongs_to :user
belongs_to :shipping infomation
belongs_to :purchase_record


## shipping infomations  テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| post                   |integer | null: false |
| city                   | string | null: false |
| address                | string | null: false |
| building_name          | string | null: false |
| phone_number           | integer| null: false |
|                        |        |             |
|                        |        |             |
|                        |        |             |
|                        |        |             |
|                        |        |             |
|                        |        |             |
|                        |        |             |


### Association
 has_many :items
 belongs_to :user
 has_one :purchase_records






##　purchase_records テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| user_id                | integer|null: false, foreign_key: true 
| item_id                | string | null: false foreign_key: true|
|                        |        |             |
|                        |        |             |
|                        |        |             |


### Association
 belongs_to :user
 belongs_to :iten
 belongs_to :shipping infomations