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

end
