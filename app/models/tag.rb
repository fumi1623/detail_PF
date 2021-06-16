class Tag < ApplicationRecord

  has_many :tag_relationships, dependent: :destroy
  has_many :events, through: :tag_relationships
  validates :name, presence: true, length: { maximum: 10 }

end
