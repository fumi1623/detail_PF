class Map < ApplicationRecord
  belongs_to :event

  validates :latitude, :longitude, :address, presence: true
  validates :name, presence: true, length: { maximum: 10 }

  geocoded_by :address
  before_validation :geocode
end
