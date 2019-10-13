require 'active_record'
require 'bcrypt'

class User < ActiveRecord::Base
  def authenticate(password)
    attempt = BCrypt::Engine.hash_secret(password, self.salt)
    return true if attempt == self.passhash
  end
end