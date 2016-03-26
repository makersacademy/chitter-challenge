require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, :as => :email_address

  property :id,               Serial
  property :name,             String, required: true
  property :username,         String, required: true, unique: true
  property :email,            String, required: true, unique: true
  property :password_digest,  Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    @user = first(:email => email)
    @user && password_match?(password) ? @user : nil
  end

  def self.password_match?(password)
    BCrypt::Password.new(@user.password_digest) == password
  end

  has n, :posts
  has n, :comments
end
