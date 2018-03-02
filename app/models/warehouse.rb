class Warehouse < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  validates :address, :presence => true

  validates :name, :uniqueness => { :scope => [:user_id] }

  validates :name, :presence => true

  validates :sqft, :presence => true

  validates :sqft, :numericality => { :greater_than => 0 }

  validates :staffed, :presence => true

  validates :staffed, :inclusion => { :in => [ 'Yes', 'No' ]  }

  validates :storage_methods, :presence => true

  validates :storage_methods, :inclusion => { :in => [ 'Double Stacked', 'Single Stacked' ]  }

end
