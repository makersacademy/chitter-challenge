require 'bcrypt'
require './data_mapper_setup'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :username, String
  property :password_digest, Text

  has n, :peeps

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end