class AddAddressFormattedAddressToWarehouse < ActiveRecord::Migration[5.0]
  def change
    add_column :warehouses, :address_formatted_address, :string
  end
end
