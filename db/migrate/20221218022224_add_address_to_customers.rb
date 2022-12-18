class AddAddressToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :address, :string, default: "", null: false
  end
end
