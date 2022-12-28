class AddDeliveryAddressToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :delivery_address, :string, default: "", null: false
  end
end
