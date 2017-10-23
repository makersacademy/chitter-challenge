require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'securerandom'

class Maker

  include DataMapper::Resource

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text
  property :password_token, String, length: 60
  attr_reader :password
  attr_accessor :password_confirmation

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password

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
    self.save
  end

  def self.find_by_valid_token(token)
    first(password_token: token)
  end

end
