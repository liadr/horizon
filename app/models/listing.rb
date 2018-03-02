class Listing < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :start_date, :presence => true

  validates :status, :presence => true

end
