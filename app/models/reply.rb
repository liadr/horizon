class Reply < ApplicationRecord
  # Direct associations

  belongs_to :review

  belongs_to :user

  # Indirect associations

  # Validations

end
