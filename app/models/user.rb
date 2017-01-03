require "data_mapper"
require "dm-postgres-adapter"
require 'bcrypt'
require 'securerandom'

class User

  include DataMapper::Resource
  has n, :peeps
  has n, :comments

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, :as => :email_address

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, Text
  property :password_token, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def authenticated?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def generate_token
    self.password_token = SecureRandom.hex
    self.save
  end

end
