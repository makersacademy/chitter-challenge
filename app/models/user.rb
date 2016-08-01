require 'bcrypt'
require 'securerandom'

class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  validates_presence_of :email
  validates_presence_of :user_name
  validates_format_of :email, as: :email_address


  property :id, Serial
  property :user_name, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :name, String
  property :password_digest, String, length: 60
  property :password_token, String, length: 60
  property :password_token_time, Time

  has n, :peep, through: Resource

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(user_name, password)
    user = first(user_name: user_name)
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
