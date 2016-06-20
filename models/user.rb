require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'securerandom'
require 'timecop'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id , Serial
  property :email, String, :required => true, :format => :email_address, :unique => true,
  :messages => {
    :presence => "Email must not be blank",
    :is_unique => "Email address already registered",
    :format => "Email has an invalid format"
  }
  property :user_name, String, :required => true, :unique => true,
  :messages => {
    :presence => "User name must not be blank",
    :is_unique => "User name already registered",
  }
  property :real_name, String, :required => true,
  :messages => {
    :presence => "Real name must not be blank",
  }

  property :password_digest, String, length: 60
  property :password_token, String, length: 60
  property :password_token_time, Time

  has n, :peeps

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)

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
