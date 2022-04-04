require 'active_record'

class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
end
