require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :handle, String, unique: true
  property :email, String, unique: true
  property :password, BCryptHash
  property :password_confirmation, Text

  def self.authenticate(email, password)
  end

end
