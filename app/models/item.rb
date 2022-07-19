class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :prefecture
  belongs_to :burden_of_shipping_charge
  belongs_to :shipping_day
  has_one_attached :image
  
  validates :image, presence: true
  validates :product_name, {presence: true, lengh: {maximum: 40}}
  validates :description_of_item, {presence: true, lengh: {maximum: 1000}}
  validates :category, presence: true
  validates :product_condition, presence: true
  validates :burden_of_shipping_charge, presence: true
  validates :prefecture, presence: true
  validates :shipping_day, presence: true
  validates :price, presence: true

 
  
  validates :user_id, numericality: { other_than: 1 } 

 
end
