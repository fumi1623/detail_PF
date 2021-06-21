class Image < ApplicationRecord
  belongs_to :event

  attachment :image
end
