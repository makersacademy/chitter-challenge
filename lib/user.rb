require 'bcrypt'

class User
  include DataMapper::Resource
  
  property :id, Serial
  property :email, Text, :format => :email_address, :unique => true
  property :username, Text, :unique => true
  property :encrypted_password, Text 

  def password=(password)
    @password = password
    self.encrypted_password = BCrypt::Password.create(password)
  end
end