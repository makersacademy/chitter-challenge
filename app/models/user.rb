require 'bcrypt'
require 'data_mapper'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text
  property :username, String

  # has n, :peeps

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
