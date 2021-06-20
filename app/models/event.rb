class Event < ApplicationRecord
  belongs_to :user
  has_many :maps
  has_many :images, dependent: :destroy
  has_many  :tag_relationships, dependent: :destroy
  has_many  :tags, through: :tag_relationships
  accepts_attachments_for :images, attachment: :image, append: true

  # バリデーション
  validates :name, presence: true, length: { maximum: 20 }
  validates :place, length: { maximum: 20 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_check
  # 終了が開始より早くならないこと
  def end_time_check
    errors.add(:end_time, 'は開始時刻より遅い時間を選択してください') if start_time.present? && end_time.present? && (end_time < start_time)
  end

  # タグ機能
  def save_tags(save_event_tags)
    current_tags = tags.pluck(:name) unless tags.nil?  # タグがあればnameを抽出
    old_tags = current_tags - save_event_tags
    new_tags = save_event_tags - current_tags

    old_tags.each do |old_name|
      tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_name|
      event_tag = Tag.find_or_create_by(name: new_name)
      tags << event_tag
    end
  end
end
