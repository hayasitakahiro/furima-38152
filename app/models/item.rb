class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :prefecture
  belongs_to :burden_of_shipping_charge
  belongs_to :shipping_day
  has_one_attached :image
  belongs_to :user
  has_one :purchase_record

  validates :image, presence: true
  validates :product_name, presence: true
  validates :description_of_item, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :product_condition_id, numericality: { other_than: 1 }
  validates :burden_of_shipping_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :shipping_day_id, numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
