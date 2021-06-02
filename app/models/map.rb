class Map < ApplicationRecord

  belongs_to :event

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :name, presence: true

  geocoded_by :address
  before_validation :geocode

end
