class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name, null: false
      t.text :description_of_item,null: false
      t.integer :category_id, null: false
      t.integer :product_condition_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :burden_of_shipping_charge_id, null: false
      t.integer :shipping_day_id, null: false
      t.integer :price, null: false
      t.references :user, null: false

    
      t.timestamps
    end
  end
end
