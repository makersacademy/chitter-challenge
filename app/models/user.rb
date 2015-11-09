require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource


  property :id,                 Serial
  property :name,               String, required: true
  property :username,           String, unique: true, required: true, message: "That username is already taken"
  property :email,              String, unique: true, required: true, message: "That email address has already been used to sign up"
  property :password_digest,    Text, required: true

  has n, :peeps

  attr_accessor :password_confirmation
  attr_reader :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user
      BCrypt::Password.new(user.password_digest) == password ? user : false
    end
  end

end
