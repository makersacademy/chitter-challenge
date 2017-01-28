# require 'spec_helper'
require 'bcrypt'

class Signup
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
