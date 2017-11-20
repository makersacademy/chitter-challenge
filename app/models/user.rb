require_relative '../data_mapper_config'
require 'bcrypt'
require 'dm-validations'
require 'securerandom'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email, String, :format => :email_address
  property :name, String
  property :password_digest, Text
  property :password_token, String, length: 60
  property :password_token_time, Time

  has n, :peeps

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :username
  validates_uniqueness_of :username

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
    save
  end

  def self.find_by_valid_token(token)
    user = first(password_token: token)
    if (user && user.password_token_time + (60 * 60) > Time.now)
      user
    end
  end
end
