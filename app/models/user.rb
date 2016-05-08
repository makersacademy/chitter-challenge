require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String, unique: true, required: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text

  attr_reader :password, :name, :email, :username
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end

end
