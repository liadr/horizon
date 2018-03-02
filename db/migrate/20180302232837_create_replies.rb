class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :body
      t.integer :user_id
      t.integer :review_id

      t.timestamps

    end
  end
end
