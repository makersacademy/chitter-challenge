require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String, required: true, message: 'You need to enter a name'
  property :username, String, unique: true, required: true, messages: {presence: 'You need to enter a username', format: 'Not a valid email address', is_unique: 'Username already taken'}
  property :email, String, unique: true, required: true, format: :email_address, messages: {presence: 'You need to enter an email address', format: 'Not a valid email address', is_unique: 'Email address already in use'}
  property :password_digest, String, length: 100
  attr_accessor :password_confirmation

  validates_confirmation_of :password, message: 'Passwords do not match, please try again'

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def self.authenticate(username, entered_password)
    user = first(username: username)
    if user && user.password == entered_password
      user
    else
      nil
    end
  end

end
