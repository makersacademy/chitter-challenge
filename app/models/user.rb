require 'dm-validations'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :username, String
  property :email, String
  property :password_hash, Text
  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password

  def password=(new_password)
    @password = new_password
    self.password_hash = Password.create(new_password)
  end

end
