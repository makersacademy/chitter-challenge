require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  attr_accessor :password_confirmation
  attr_reader :password

  property :id,            Serial
  property :name,          String
  property :username,      String
  property :email,         String, required: true
  property :password_hash, Text

  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, as: :email_address
  validates_uniqueness_of :email
  validates_uniqueness_of :username

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user if user && BCrypt::Password.new(user.password_hash) == password
  end

end
