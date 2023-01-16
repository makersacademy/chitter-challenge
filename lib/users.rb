class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  has_many :replies
  has_many :posts
end
