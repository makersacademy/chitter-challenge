require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true
  property :password_digest, Text, required: true
  property :username, String, required: true
  property :name, String, required: true

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
