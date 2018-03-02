class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.integer :user_id
      t.integer :state_id
      t.text :name
      t.string :sqft
      t.string :address
      t.string :staffed
      t.string :storage_methods
      t.integer :total_stars
      t.integer :num_reviews

      t.timestamps

    end
  end
end
