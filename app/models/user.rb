require 'bcrypt'
require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :digest, Text
  property :handle, String, unique: true
  property :email, Text, unique: true

  def password=(password)
    self.digest = BCrypt::Password.create(password)
  end
end
