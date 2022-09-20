class User < ActiveRecord::Base
  # ActiveRecord method for authentication using BCrypt
  has_many :peeps, :dependent => :destroy
  has_secure_password
  validates_uniqueness_of :email
  validates_uniqueness_of :username
end
