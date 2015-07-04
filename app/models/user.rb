require 'bcrypt'

class User
  include DataMapper::Resource

  attr_accessor :password_confirmation

  property :id,            Serial
  property :email,         String
  property :password_hash, Text

  def password= password
    self.password_hash = BCrypt::Password.create password
  end
end
