class AddAddressToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :address, :string, default: "", null: false
  end
end
