require 'data_mapper'
require 'dm-validations'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource
  property :id, Serial
  property :username, String
  property :email, String
  property :password_digest, Text

  has n, :messages

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :email, :username, :password_digest
  validates_uniqueness_of :username, :email
  validates_format_of :email, :as => :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.exists?(username, email)
    if !!(first(username: username))
      "username"
    elsif !!(first(email: email))
      "email"
    else false
    end
  end

  def self.login(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else false
    end
  end
end
