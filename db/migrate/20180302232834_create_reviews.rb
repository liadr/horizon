class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :warehouse_id
      t.text :body
      t.integer :num_stars

      t.timestamps

    end
  end
end
