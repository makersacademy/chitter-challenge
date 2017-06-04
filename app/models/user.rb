require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password

  property :id,              Serial
  property :email,           String, format: :email_address, required: true, unique: true
  property :username,        String, required: true, unique: true
  property :first_name,      String
  property :last_name,       String
  property :password_digest, Text
  property :avatar,          String

  has n, :peeps

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
