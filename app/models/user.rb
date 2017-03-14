require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,           Serial
  property :email,        Text
  property :password_digest, Text
  property :name,         String
  property :username,     String

   def password=(password)
     self.password_digest = BCrypt::Password.create(password)
   end

  def self.authenticate(email, password)
    first(email: email)
  end

  has n, :peeps

end
