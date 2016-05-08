require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  # has n, :tags, through: Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :handle, String
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
