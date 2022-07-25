class PurchaseRecord < ApplicationRecord
  has_one :shipping_infomation
  belongs_to :user
  belongs_to :item

end
