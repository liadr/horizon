class Listing < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :sqft_available, :presence => true

  validates :start_date, :presence => true

  validates :status, :presence => true

end
