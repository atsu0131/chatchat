class User < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :favorite_chats, through: :favorites, source: :chat

  mount_uploader :image_icon, ImageUploader

  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
    format:{ with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
      before_validation { email.downcase! }
      has_secure_password
      validates :password, presence: true, length: { minimum: 6 }
  validates :image_icon, presence: true
end
