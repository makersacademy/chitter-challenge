require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, Text

  attr_reader :name, :username, :password
  attr_accessor :password_confirmation
  validates_presence_of :name, :username, :email
  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def authenticate(username_email,password)
    first(username: username_email) || first(email: username_email)
  end
end
