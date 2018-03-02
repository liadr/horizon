class Review < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :body, :presence => true

  validates :num_stars, :presence => true

  validates :num_stars, :inclusion => { :in => [ '1', '2', '3', '4', '5' ]  }

end
