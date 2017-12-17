require 'bcrypt'

class User
  include DataMapper::Resource
  require 'securerandom'

  property :id,             Serial
  property :email,          String, unique: true, format: :email_address, required: true
  property :name,           String
  property :username,       String, :unique => true, required: true
  property :user_password,  Text
  property :password_token, String, length: 60
  property :password_token_time, Time

  has n, :peeps

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, message: "Your passwords do not match!"

  def password=(password)
    @password = password
    self.user_password = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.user_password) == password
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
