require 'sinatra/activerecord'

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  has_secure_password

  has_many :peeps
end
