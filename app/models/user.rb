require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :username, String, required: true, unique: true,
    messages: {
      presence: 'Please enter a username',
      is_unique: 'Username already in use'
    }
  property :email, String, required: true, unique: true,
    messages: {
      presence: 'Please enter an email address',
      is_unique: 'Email already registered'
    }
  property :name, String
  property :password_digest, String, length: 100
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = Password.create(password)
    self.password_digest = @password
  end

  def self.authenticate(username, password)
    user = first(username: username)
    user if user && Password.new(user.password_digest) == password
  end
end
