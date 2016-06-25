require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, Text
  property :username, Text, unique: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end
end
