require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String, format: :email_address, required: true, unique: true
  property :username, String, required: true, unique: true
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
