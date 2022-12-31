class RenameDeliveryNameColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :delivery_name, :name
  end
end
