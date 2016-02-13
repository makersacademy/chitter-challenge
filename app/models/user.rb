require 'dm-validations'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :username, String, unique: true, required: true
  property :email, String, unique: true, required: true, format: :email_address
  property :password_digest, Text

  # has n, :peeps, through: Resource


  attr_accessor :password_confirmation
  attr_reader :password
  validates_confirmation_of :password

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(password)
    @password = BCrypt::Password.create(password)
    self.password_digest = @password
  end

  def self.authenticate(username, login_password)
    user = first(username: username)
    user if user && user.password == login_password
  end



end
