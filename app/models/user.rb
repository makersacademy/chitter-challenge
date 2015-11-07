require 'bcrypt'

class User
  include DataMapper::Resource
  attr_accessor :password_confirmation

  property :id, Serial
  property :user_name, String
  property :email, String
  property :password, BCryptHash

  validates_confirmation_of :password
end
