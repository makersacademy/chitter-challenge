require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

  property :id,   Serial
  property :username, String
  property :password_digest, Text, lazy: false

  attr_reader :username, :id

  def password=(new_password)
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def authenticate(entered_password)
    BCrypt::Password.new(self.password_digest) == entered_password
  end

end
