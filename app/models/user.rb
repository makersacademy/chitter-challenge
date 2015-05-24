require 'bcrypt'

class User

  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_length_of :username, min: 1
  validates_length_of :name, min: 1
  validates_length_of :email, min: 1
  validates_length_of :password, min: 1

  property :id, Serial
  property :email, String, unique: true, message: 'Email is already taken'
  property :password_digest, Text
  property :name, String
  property :username, String, unique: true, message: 'Username is already taken'

  has n, :peeps, through: Resource

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end

end