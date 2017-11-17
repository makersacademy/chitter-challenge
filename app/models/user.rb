require 'bcrypt'
require 'data_mapper'

class User
  include DataMapper::Resource

  property :username, String
  property :digest, Text

  def password=(password)
    self.digest = Bcrypt::Password.create(password)
  end
end
