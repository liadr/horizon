class User < ApplicationRecord
  # Direct associations

  has_many   :replies,
             :dependent => :destroy

  has_many   :reviews,
             :dependent => :destroy

  has_many   :warehouses,
             :dependent => :destroy

  has_many   :favorites,
             :dependent => :destroy

  has_many   :reservations,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :first_name, :presence => true

  validates :last_name, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
