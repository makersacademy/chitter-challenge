require 'bcrypt'
class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String ,:unique => true
  property :password_digest, Text
  property :password_confirmation, Text
  property :name, String
  property :username, String

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_uniqueness_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = User.first(:email => email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end