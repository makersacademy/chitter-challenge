require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :username,  String, unique: true, required: true
  property :email, String, format: :email_address, unique: true, required: true
  property :password_digest, Text, required: true

  validates_length_of :password, min: 8

  attr_reader :password
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
