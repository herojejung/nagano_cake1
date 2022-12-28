class RemoveDeliveryAdressFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :delivery_adress, :string
  end
end
