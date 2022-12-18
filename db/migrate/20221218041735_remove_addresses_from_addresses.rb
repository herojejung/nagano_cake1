class RemoveAddressesFromAddresses < ActiveRecord::Migration[6.1]
  def change
    remove_column :addresses, :addresses, :string
  end
end
