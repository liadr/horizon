class Warehouse < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :presence => true

  validates :sqft, :presence => true

  validates :sqft, :numericality => { :greater_than => 0 }

  validates :staffed, :presence => true

  validates :staffed, :inclusion => { :in => [ 'Yes', 'No' ]  }

  validates :storage_methods, :presence => true

  validates :storage_methods, :inclusion => { :in => [ 'Double Stacked', 'Single Stacked' ]  }

end
