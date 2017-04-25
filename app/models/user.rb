# # This class will be responsible for the user.
require 'bcrypt'

class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  has n, :meows, through: Resource

  property :id,       Serial
  property :email,    String, format: :email_address, required: true, unique: true
  property :username, String, required: true, unique: true
  property :name,     String, required: true

  property :password_digest, Text
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
