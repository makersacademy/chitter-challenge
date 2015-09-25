require 'bcrypt'
require './data_mapper_setup'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, unique: true
  property :username, String, required: true, unique: true
  property :password_digest, Text

  has n, :peeps

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  def self.exists(email)
    user = first(email: email)
    if user
      user
    else
      nil
    end
  end

end