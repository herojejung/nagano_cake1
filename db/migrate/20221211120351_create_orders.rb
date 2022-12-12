class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id,null: false, default: ""
      t.string :delivery_postal_code, null: false, default: ""
      t.string :delivery_adress, null: false, default: ""
      t.string :delivery_name, null: false, default: ""
      t.integer :shipping_fee, null: false, default: ""
      t.integer :bill, null: false, default: ""
      t.integer :payment_method, null: false, default: ""
      t.integer :status, null: false, default: ""
      t.timestamps
    end
  end
end
