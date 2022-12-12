class CreateOrderDetailas < ActiveRecord::Migration[6.1]
  def change
    create_table :order_detailas do |t|
      t.integer :item_id,null: false, default: ""
      t.integer :order_id,null: false, default: ""
      t.integer :amount,null: false, default: ""
      t.integer :amount_billed,null: false, default: ""
      t.integer :making_status,null: false, default: ""
      t.timestamps
    end
  end
end
