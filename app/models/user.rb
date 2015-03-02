require 'bcrypt'

class User
  include DataMapper::Resource

  # attr_accessor :password_token, :password_token_timestamp

  property :id,                 Serial
  property :name,               String, required: true
  property :username,           String, unique: true, required: true, message: "That username is already taken"
  property :email,              String, unique: true, required: true, message: "That email address has already been used to sign up"
  property :password_digest,    Text, required: true
  property :password_token,     Text, length: 64
  property :password_token_timestamp, DateTime

  has n, :cheeps


  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user
      BCrypt::Password.new(user.password_digest) == password ? user : false
    else
      nil
    end
  end

end