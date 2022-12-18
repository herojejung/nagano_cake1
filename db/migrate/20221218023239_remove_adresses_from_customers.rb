class RemoveAdressesFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :adresses, :string
  end
end
