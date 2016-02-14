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
  def self.authenticate(username, password)
    user = first(username: username)
    if user && user.password == password
      user
    else
      nil
    end
  end
  #def password=(password)
    #self.password_digest = Bcrypt::Password.create(password)
  #end

end
