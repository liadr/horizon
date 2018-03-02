class Warehouse < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :storage_methods, :presence => true

  validates :storage_methods, :inclusion => { :in => [ 'Double Stacked', 'Single Stacked' ]  }

end
