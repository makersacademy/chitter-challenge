class User < ActiveRecord::Base
  has_secure_password
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  has_many :posts, :dependent => :destroy
end