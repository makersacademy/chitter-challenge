require 'bcrypt'
# require 'dm-validations'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String, required: true
  property :password, BCryptHash

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

end
