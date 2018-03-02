class Listing < ApplicationRecord
  # Direct associations

  belongs_to :warehouse

  has_many   :reservations,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :end_date, :presence => true

  validates :price, :presence => true

  validates :sqft_available, :presence => true

  validates :start_date, :presence => true

  validates :status, :presence => true

end
