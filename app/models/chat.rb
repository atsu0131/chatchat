class Chat < ApplicationRecord
  has_many :favorites, dependent: :destroy
  belongs_to :user
  has_many :favorite_users, through: :favorites, source: :user

  validates :content, length:{in: 1..140}
  validates :content, presence: true
end
