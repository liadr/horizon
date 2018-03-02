class Warehouse < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :staffed, :presence => true

  validates :staffed, :inclusion => { :in => [ 'Yes', 'No' ]  }

  validates :storage_methods, :presence => true

  validates :storage_methods, :inclusion => { :in => [ 'Double Stacked', 'Single Stacked' ]  }

end
