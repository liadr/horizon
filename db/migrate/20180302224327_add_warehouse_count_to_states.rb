class AddWarehouseCountToStates < ActiveRecord::Migration[5.0]
  def change
    add_column :states, :warehouses_count, :integer
  end
end
