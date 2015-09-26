require 'bcrypt'
class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, required: true
  property :name, String, required: true
  property :nickname, String, required: true
  property :password_digest, Text

  validates_uniqueness_of :email, :nickname
  validates_confirmation_of :password
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = User.first(email: email)
    user if user && (BCrypt::Password.new(user.password_digest) == password)
  end

  has n, :peeps
end
