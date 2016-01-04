require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :username, String
  property :password_digest, Text

  # Password encryption
  attr_reader :password
  attr_accessor :password_confirmation

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(@password)
  end

  # Authentication
  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      # return this user
      user
    else
      nil
    end
  end

  # Validations
  validates_confirmation_of :password
  validates_format_of :email, as: :email_address, message: 'Please enter a valid email address mate'
  validates_uniqueness_of :email, :username, message: 'That email or username is already registered mate'
  validates_presence_of :password, :name, :username, :email, message: 'All fields are required mate'
end
