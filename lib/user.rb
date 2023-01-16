class User < ActiveRecord::Base
  has_many :peeps
  # one to many association
  # peeps associated via user_id
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  has_secure_password
end