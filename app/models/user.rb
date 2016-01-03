require 'bcrypt'
require 'dm-validations'
require 'securerandom'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, unique: true, required: true
  property :email, String, unique: true, format: :email_address, required: true,
           messages: {
              presence: 'Please enter an email address',
              is_unique: 'That email address is already registered',
              format: 'Please enter a valid email address'
            }
  property :password_digest, Text
  property :password_token, Text
  property :password_token_time, Time

  has n, :peeps, through: Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, message:'Passwords did not match'

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password) if password.size > 0
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
    if (user && user.password_token_time + (60 * 60) > Time.now)
      user
    end
  end

end
