require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password, message: 'Your passwords do not match'

  property :id, Serial
  property :username, String, required: true, unique: true, message: 'Username already registered'
  property :email, String, required: true, unique: true, message: 'Email already registered'
  property :password_digest, Text, required: true

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end