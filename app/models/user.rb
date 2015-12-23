require 'data_mapper'
require 'bcrypt'
# require 'dm-postgres-adapter'
# require 'dm-migrations'

class User
  include DataMapper::Resource

  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
