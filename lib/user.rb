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

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.encrypted_password) == password
      user
    else
      nil
    end
  end
end