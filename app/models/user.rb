require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_reader :email

  property :id, Serial
  property :email, String
  property :name, String
  property :username, String
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    first(email: email)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
