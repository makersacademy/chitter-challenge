require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String, :unique => true
  property :email, String, :unique => true
  property :password_digest, Text

  has n, :messages

  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password, :confirm => :password_confirmation
  validates_with_method :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(:email => email)
    if user && (BCrypt::Password.new(user.password_digest) == password)
      user
    else
      nil
    end
  end
  
end
