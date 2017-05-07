require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password, Text

  def password_digest=(password)
    self.password_digest = BCrypt::Password.create(password)
  end


end
