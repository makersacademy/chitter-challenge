require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

  property :id,   Serial
  property :username, String
  property :password_digest, Text

  def password=(new_password)
    self.password_digest = BCrypt::Password.create(new_password)
  end

end
