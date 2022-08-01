class ShippingPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :address, :building_name, :phone_number, :purchase_record, :prefecture_id,
  :burden_of_shipping_charge_id, :product_name, :user_id, :item_id, :token

  
  

  with_options presence: true do
  validates :city
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :address
  validates :token
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'number is invalid. Include half-width numbers' } 
  
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :user_id
  validates :item_id

end


   
    def save
      
      purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
      
      shipping = ShippingInfomation.create!(postal_code: postal_code, city: city, address: address, building_name: building_name,
      phone_number: phone_number, purchase_record_id: purchase_record.id, prefecture_id: prefecture_id)
    end
  end
  
 

