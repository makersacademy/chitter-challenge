require 'bcrypt'
require 'securerandom'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  property :username, String, :required => true, :unique => true
  property :email, String, :required => true, :unique => true
  property :password_digest, Text, :required => true
  property :password_token, String
  property :password_token_time, Time

  has n, :peeps, :through => Resource

  attr_reader :password
  attr_accessor :password_confirmation

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_presence_of :email
  validates_format_of :email, as: :email_address
  validates_presence_of :password
  validates_confirmation_of :password

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  def self.find_by_valid_token(password_token)
    user = first(password_token: password_token)
    if user && user.password_token_time + 3600 > Time.now
      user
    end
  end

  def generate_token
    self.password_token = SecureRandom.hex
    self.password_token_time = Time.now
    self.save!
  end

end
