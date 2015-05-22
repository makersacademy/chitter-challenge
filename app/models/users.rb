require 'bcrypt'

class User

  include DataMapper::Resource
  property :id,         Serial    # An auto-increment integer key
  property :username,   String,  required: true, unique: true
  property :email,      String,  required: true, unique: true
  property :password_digest,   Text,  required: true

  attr_reader :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password) unless password.empty?
  end

end
