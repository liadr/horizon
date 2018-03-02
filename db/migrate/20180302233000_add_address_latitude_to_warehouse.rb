class AddAddressLatitudeToWarehouse < ActiveRecord::Migration[5.0]
  def change
    add_column :warehouses, :address_latitude, :float
  end
end
