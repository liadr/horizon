class AddAddressLongitudeToWarehouse < ActiveRecord::Migration[5.0]
  def change
    add_column :warehouses, :address_longitude, :float
  end
end
