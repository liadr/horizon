class Reservation < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :status, :presence => true

  validates :status, :inclusion => { :in => [ 'Approved', 'Declined', 'Pending' ]  }

end
