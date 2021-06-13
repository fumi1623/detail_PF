class Map < ApplicationRecord

  belongs_to :event

  validates :latitude, :name, :longitude, presence: true

  geocoded_by :address
  before_validation :geocode

end
