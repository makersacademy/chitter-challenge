require './app/data_mapper_setup'
require 'bcrypt'
require 'dm-validations'

class User
  attr_reader :password
  attr_accessor :password_confirmation
  
  include DataMapper::Resource

  has n, :peeps, through: Resource

  property :id, Serial
  property :name, String
  property :username, String

  property :password_digest, String
  validates_confirmation_of :password

  property :email, String

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = User.first(username: username)
    user && BCrypt::Password.new(user.password_digest) == password
  end
end
