require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, :unique => true
  property :password_digest, Text
  property :username, Text, :unique => true

  has n, :cheets

  def password= (password)
    self.password_digest = BCrypt::Password.create(password)
  end


end