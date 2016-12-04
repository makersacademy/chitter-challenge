require 'data_mapper'
require 'dm-validations'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource
  property :id, Serial
  property :username, String
  property :email, String
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.login(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      true
    else
      false
    end
  end
end
