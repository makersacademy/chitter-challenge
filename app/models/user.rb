require 'bcrypt'

class User
  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :password_hash, Text
  property :name, String
  property :username, String

  def pass=(password)
    self.password_hash = BCrypt::Password.create(password)
  end

end
