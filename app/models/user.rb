require 'bcrypt'
require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, Text
  property :name, String
  property :handle, String
  property :digest, Text

  def password=(password)
    self.digest = BCrypt::Password.create(password)
  end
end
