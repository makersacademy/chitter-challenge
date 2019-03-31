require 'sinatra/activerecord'
require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many :messages
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  has_secure_password

# before_save do
#   BCrypt::Password.create(password)
# end

end
