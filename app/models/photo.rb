class Photo < ApplicationRecord
  # Direct associations

  belongs_to :warehouse

  # Indirect associations

  # Validations

  validates :image, :uniqueness => { :scope => [:warehouse_id] }

  validates :image, :presence => true

end
