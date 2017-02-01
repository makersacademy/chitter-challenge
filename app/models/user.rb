require 'data_mapper'
require 'bcrypt'
require 'dm-validations'
require 'securerandom'
require 'timecop'

class User
  include DataMapper::Resource
  include BCrypt

  has n, :peeps
  has n, :comments


  property :id,                  Serial
  property :name,                String,  required: true
  property :username,            String,  required: true,
                                          unique: true,
                                          messages: {
                                              required: "An email address must be inserted.",
                                              is_unique: "The inserted email is already registered. Choose a different one.",
                                          }

  property :email,               String,  required: true,
                                          unique: true,
                                          format: :email_address,
                                          messages: {
                                              required: "An email address must be inserted.",
                                              is_unique: "The inserted email is already registered. Choose a different one.",
                                              format: "Doesn't look like an email address."
                                          }
  property :password_digest,     String,  length: 60
  property :password_token,      String,  length: 60
  property :password_token_time, Time

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password, :password_confirmation

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
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
