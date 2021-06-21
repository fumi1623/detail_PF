class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :events, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users

  validates :name, presence: true, length: { minimum: 2, maximum: 15 }
end
