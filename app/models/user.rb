require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt

  property :id,       Serial
  property :name,     String
  property :username, String
  property :email,    String
  property :password_hash, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_presence_of :email, :message => "Please enter an email address"
  validates_format_of :email, as: :email_address, :message => "Incorrect email format"
  validates_confirmation_of :password, :message => "Password and confirmation do not match"
  validates_uniqueness_of :email, :message => "Email is already registered"

  def password=(password)
    @password = Password.create(password)
    self.password_hash = @password
  end

end
