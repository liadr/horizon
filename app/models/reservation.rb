class Reservation < ApplicationRecord
  # Direct associations

  belongs_to :listing,
             :counter_cache => true

  belongs_to :user

  # Indirect associations

  # Validations

  validates :status, :presence => true

  validates :status, :inclusion => { :in => [ 'Approved', 'Declined', 'Pending' ]  }

end
