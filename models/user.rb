# Creates new uses with user information
require 'bcrypt'

class User

  attr_reader :password

  include DataMapper::Resource

  has n, :peeps, through: Resource

  property :id, Serial
  property :email, String, required: true, unique: true
  property :name, String
  property :username, String, required: true, unique: true
  property :password_digest, Text

  def password=(password)
  @password=password
  self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    first(email: email)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      return user
    else
      nil
    end
  end


end
