class User < ActiveRecord::Base
  include ActiveModel::SecurePassword
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :replies, dependent: :destroy
end