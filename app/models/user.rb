require 'bcrypt'
require 'securerandom'
require 'timecop'

class User
  include DataMapper::Resource

  has n, :peeps, through: Resource

  property :id, Serial
  property :name, String
  property :username, String, unique: true, required: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text
  property :password_token, Text
  property :password_token_time, Time

  attr_reader :password, :name, :email, :username
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end

  def generate_token
    self.password_token = SecureRandom.hex
    self.password_token_time = Time.now
    self.save
  end

  def self.find_by_valid_token(token)
    user = first(password_token: token)
    user if user && user.password_token_time + (60 * 60) > Time.now
  end

end
