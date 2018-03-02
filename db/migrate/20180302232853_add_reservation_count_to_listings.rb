class AddReservationCountToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :reservations_count, :integer
  end
end
