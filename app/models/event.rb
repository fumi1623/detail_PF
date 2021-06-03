class Event < ApplicationRecord

  belongs_to :user
  has_many :maps
  has_many :images, dependent: :destroy
  accepts_attachments_for :images, attachment: :image

end
