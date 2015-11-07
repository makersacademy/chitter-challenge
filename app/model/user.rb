require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_hash, Text

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    user && BCrypt::Password.new(user.password_hash) == password ? user : nil
  end

end
