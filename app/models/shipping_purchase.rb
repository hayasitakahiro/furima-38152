class ShippingPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :address, :building_name, :phone_number, :purchase_record, :prefecture_id,
   :price, :burden_of_shipping_charge_id, :product_name, :user_id, :item_id

  
  attr_accessor :token
 
  validates :token, presence: true
  with_options presence: true do
  validates :city, presence: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :address, presence: true
  
  validates :phone_number, format: { with: /\A0[0-9]+\z/, message: 'number is invalid. Include half-width numbers' } 
 
  validates :prefecture_id, presence: true
  end

 
   
    def save
      
      purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
      
      shipping = ShippingInfomation.create!(postal_code: postal_code, city: city, address: address, building_name: building_name,
      phone_number: phone_number, purchase_record_id: purchase_record.id, prefecture_id: prefecture_id)
    end
  end
  
 

