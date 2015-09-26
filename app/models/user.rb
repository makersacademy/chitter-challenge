require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,              Serial
  property :email,           String, unique: true
  property :password_digest, Text
  property :name,            String
  property :username,        String, unique: true

  attr_reader :email
  attr_reader :password
  attr_reader :name
  attr_reader :username

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
