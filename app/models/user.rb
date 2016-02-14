require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'
require_relative 'peep'
require 'securerandom'


class User
  include DataMapper::Resource
  include BCrypt

  attr_accessor :password_confirmation
  attr_reader :password, :username

  has n, :peeps

  property :id,   Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String,  :required => true, :unique => true
  property :password_digest, Text
  property :password_token, Text
  property :password_token_time, Time

  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, :as => :email_address
  validates_uniqueness_of :email


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
    self.save
  end

  def generate_token
    self.password_token = SecureRandom.hex
    self.password_token_time = Time.now
    self.save
  end

  def self.find_by_valid_token(token)
    first(password_token: token)
  end

  def self.find_by_valid_token(token)
    user = first(password_token: token)
    if (user && user.password_token_time + (60 * 60) > Time.now)
      user
    end
  end

end
