class AddFavoriteCountToWarehouses < ActiveRecord::Migration[5.0]
  def change
    add_column :warehouses, :favorites_count, :integer
  end
end
