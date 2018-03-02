require 'open-uri'
class Warehouse < ApplicationRecord
  before_validation :geocode_address

  def geocode_address
    if self.address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many   :favorites,
             :dependent => :destroy

  has_many   :reviews,
             :dependent => :destroy

  has_many   :listings,
             :dependent => :destroy

  has_many   :photos,
             :dependent => :destroy

  belongs_to :city,
             :class_name => "State",
             :foreign_key => "state_id",
             :counter_cache => true

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
