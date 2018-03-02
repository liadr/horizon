class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :warehouse_id
      t.string :price
      t.string :sqft_available
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps

    end
  end
end
