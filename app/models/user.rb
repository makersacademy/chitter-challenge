require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id,             Serial
  property :first_name,     String
  property :last_name,      String
  property :username,       String
  property :email,          String
  property :password_digest,Text

  has n, :peeps

  attr_reader :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = User.first(email: email)
    return user if user && BCrypt::Password.new(user.password_digest) == password
  end
end
