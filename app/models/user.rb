require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :username, String,
           required: true, unique: true,
           messages: {
             is_unique: 'Username is already registered',
             presence: 'You need a username'
           }

  property :name, String,
           required: true,
           message: 'We need your name'

  property :password_digest, Text,
           required: true,
           message: 'You have to insert a password'

  property :email, String,
           required: true, unique: true, format: :email_address,
           messages: {
             format: 'You have to insert a valid email address',
             is_unique: 'Email is already registered',
             presence: 'We need your email'
           }

  property :password_token, Text
  property :password_token_timestamp, Time

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password,
                            message: "Password doesn't match"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end

end