class State < ApplicationRecord
  # Direct associations

  has_many   :warehouses,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
