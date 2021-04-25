class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name,  presence: true, length: { maximum: 15 }
  validates :email, presence: true, length: { maximum: 280 },
  format: { with: VALID_EMAIL_REGEX }
end
