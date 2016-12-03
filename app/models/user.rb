require 'dm-core'
require 'dm-validations'
require 'bcrypt'

class User

  include DataMapper::Resource

  has n, :peeps, :through => Resource

  property :id, Serial
  property :email, String, :unique => true
  property :name, String
  property :username, String, :unique => true
  property :password_hash, Text


  def password=(password)
    self.password_hash = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = User.first(email: email)
    if BCrypt::Password.new(user.password_hash) == password
      user
    end
  end

end
