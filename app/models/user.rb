require 'dm-core'
require 'dm-validations'
require 'bcrypt'
require 'securerandom'

class User

  include DataMapper::Resource

  has n, :peeps, :through => Resource

  property :id, Serial
  property :email, String, :unique => true
  property :name, String
  property :username, String, :unique => true
  property :password_hash, Text
  property :password_token, Text
  property :password_token_time, Time


  def password=(password)
    self.password_hash = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = User.first(email: email)
    if BCrypt::Password.new(user.password_hash) == password
      user
    end
  end

  def generate_token
    self.password_token = SecureRandom.hex
    self.password_token_time = Time.now
    self.save
  end

  def self.find_user_by_token(token)
    user = User.first(password_token: token)
    if user && (Time.now < user.password_token_time + 3600)
      user
    end
  end

end
