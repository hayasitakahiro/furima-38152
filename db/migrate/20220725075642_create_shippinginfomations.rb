class CreateShippinginfomations < ActiveRecord::Migration[6.0]
  def change
    create_table :shippinginfomations do |t|

      t.timestamps
    end
  end
end
