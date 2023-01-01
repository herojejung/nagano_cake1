class ChangeOrderDetailasToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    rename_table :order_detailas, :order_details
  end
end
