require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  attr_reader :password

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    case
    when user && BCrypt::Password.new(user.password_digest) == password then user
    else nil
    end
  end
end
