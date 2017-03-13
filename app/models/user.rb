require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id,       Serial
  property :username, String, required: true, unique: true
  property :password_digest, Text
  property :email,    String, required: true, unique: true

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
