class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 15 }
  validates :email, presence: true, length: { maximum: 280 }
end
