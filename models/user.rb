class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /[^@\s]+@[^@\s]+/ }
  validates :username, presence: true, uniqueness: true
  has_many :peeps, through: :likes
end
