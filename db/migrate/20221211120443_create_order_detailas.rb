class CreateOrderDetailas < ActiveRecord::Migration[6.1]
  def change
    create_table :order_detailas do |t|

      t.timestamps
    end
  end
end
