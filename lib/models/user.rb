require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, Text

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user && Password.new(user.password_digest) == password ? user : nil
  end

end
