require 'bcrypt'
# require 'securerandom'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String, required: true, unique: true
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, Text
  property :password_token, Text
  property :password_token_time, Time

  has n, :peeps

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, as: :email_address

  def password=(new_password)
    @password = new_password
    self.password_digest = Password.create(new_password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user && Password.new(user.password_digest) == password ? user : nil
  end

  def generate_token
    self.password_token = SecureRandom.hex
    self.password_token_time = Time.now
    self.save
  end
  
  def self.find_by_valid_token(token)
    user = first(password_token: token)
    user if user && user.password_token_time + (60 * 60) > Time.now
  end
end
