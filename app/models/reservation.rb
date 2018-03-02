class Reservation < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :status, :inclusion => { :in => [ 'Approved', 'Declined', 'Pending' ]  }

end
