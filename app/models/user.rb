require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id,              Serial
  property :name,            String,  required: true
  property :username,        String,  required: true, unique: true
  property :email,           String,  required: true, unique: true
  property :password_digest, Text,    required: true

  has n, :posts, through: Resource

  def password=(password)
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
