class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :warehouse,
             :counter_cache => true

  belongs_to :user

  # Indirect associations

  # Validations

end
