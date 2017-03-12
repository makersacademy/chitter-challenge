require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,           Serial
  property :email,        Text
  property :password_digest, Text

   def password=(password)
     self.password_digest = BCrypt::Password.create(password)
   end

  property :name,         String
  property :username,     String

  def self.authenticate(email, password)
    first(email: email)
  end

  #has n, :peeps

end
