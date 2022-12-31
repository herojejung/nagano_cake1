class RenameDeliveryPostalCodeColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :delivery_postal_code, :postal_code
  end
end
