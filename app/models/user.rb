require 'data_mapper'
require 'dm-postgres-adapter'
require './app/data_mapper_setup'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :name, String
  property :username, String
  property :password, Text
  property :password_digest, Text

  validates_presence_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      @current_user = user
    else
      nil
    end
  end

  def log_out
    @current_user = nil
  end

  def current_user
    @current_user
  end



end
