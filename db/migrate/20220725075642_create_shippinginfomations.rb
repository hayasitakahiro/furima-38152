class CreateShippinginfomations < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_infomations do |t|
      t.string :postal_code, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building_name, null: false
      t.string :phone_number, null: false
      t.references :purchase_record, null: false,foreign_key: true
      t.integer :prefecture_id, null: false
     
    end
  end
end

## shipping_infomations  テーブル
