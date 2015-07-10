require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String

  property :password_digest, Text

  validates_confirmation_of :password
  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :username
  validates_presence_of :password
  validates_uniqueness_of :username

  def self.authenticate(username, password)
    
    user = first(username: username)
    
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end

  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
