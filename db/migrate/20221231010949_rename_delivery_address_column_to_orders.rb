class RenameDeliveryAddressColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :delivery_address, :address
  end
end
