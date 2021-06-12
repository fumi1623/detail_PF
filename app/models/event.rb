class Event < ApplicationRecord

  belongs_to :user
  has_many :maps
  has_many :images, dependent: :destroy
  has_many  :tag_relationships, dependent: :destroy
  has_many  :tags, through: :tag_relationships
  accepts_attachments_for :images, attachment: :image, append: true

  def save_tags(save_event_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?  #タグがあればnameを抽出
    old_tags = current_tags - save_event_tags
    new_tags = save_event_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_name|
      event_tag = Tag.find_or_create_by(name: new_name)
      self.tags << event_tag
    end
  end

end
