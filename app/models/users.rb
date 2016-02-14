require 'data_mapper'
#require 'bcrypt'

class User
  include DataMapper::Resource
  #include Bcrypt

  property :id, Serial
  property :username, String
  property :email, String
  property :name, String
  property :password, Text

  #def password=(password)
    #self.password_digest = Bcrypt::Password.create(password)
  #end

end
