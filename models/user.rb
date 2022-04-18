class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  has_secure_password
  validates :password, length: { in: 8..20 }
  has_many :peeps
end
