class Review < ApplicationRecord
  # Direct associations

  has_many   :replies,
             :dependent => :destroy

  belongs_to :warehouse

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :body, :presence => true

  validates :num_stars, :presence => true

  validates :num_stars, :inclusion => { :in => [ '1', '2', '3', '4', '5' ]  }

end
