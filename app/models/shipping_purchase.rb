class ShippingPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :address, :building_name, :phone_number, :purchase_record :prefecture_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
  validates :city
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :address
  validates :building_name
  validates :phone_numbere, format: { with: /\A0[0-9]+\z/, message: 'number is invalid. Include half-width numbers' } 
  validates :purchase_record
  validates :prefecture_id
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    def save
      # 寄付情報を保存し、変数donationに代入する
      purchase = Purchase.create(item: item_id, user_id: user_id)
      # 住所を保存する
      # donation_idには、変数donationのidと指定する
      Shipping.create(postal_code: postal_code, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_record: purchase_record, prefecture_id: prefecture_id)
    end
  end
  
  
  end
end

