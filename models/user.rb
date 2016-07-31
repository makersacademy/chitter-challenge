require 'bcrypt'

class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id,              Serial
  property :email,           String, required: true, unique: true, format: :email_address
  property :name,            String, required: true
  property :username,        String, required: true, unique: true
  property :password_digest, String, length: 60

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
