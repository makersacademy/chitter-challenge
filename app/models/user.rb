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

  # Validations
  validates_confirmation_of :password
  validates_format_of :email, as: :email_address, message: 'Please enter a valid email address mate'
  validates_uniqueness_of :email, message: 'Email already registered mate'
  validates_presence_of :password, :name, :username, :email, message: 'All fields are required mate'
end
