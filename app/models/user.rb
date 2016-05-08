require "bcrypt"
require "dm-validations"
require "securerandom"

class User
  include DataMapper::Resource

  ONE_HOUR = 60 * 60

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, required: true, format: :email_address, unique: true
	property :password_digest, Text, required: true
  property :password_token, Text
  property :password_token_time, Time

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, attempted_password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == attempted_password
      user
    end
  end

  def store_token
    self.password_token = SecureRandom.hex
    self.password_token_time = Time.now
    self.save
  end

  def self.find_by_token(token)
    user = first(password_token: token)
    if user && Time.now < user.password_token_time + ONE_HOUR
      user
    end
  end
end
