require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, :unique => true
  property :password_digest, Text
  property :name, Text
  property :username, Text, :unique => true

  has n, :cheets

  attr_reader :password

  validates_uniqueness_of :email
  validates_uniqueness_of :username

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email,password)
    user = first(:email => email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end


end