class Photo < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :image, :uniqueness => { :scope => [:warehouse_id] }

  validates :image, :presence => true

end
