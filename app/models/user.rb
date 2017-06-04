require 'bcrypt'

# require_relative 'models/homepage'

class User
  include DataMapper::Resource

  property :id,              Serial
  property :email,           String
  property :password_digest, Text

# this will store both the password and the salt
  # It's Text and not String because String holds
  # only 50 characters by default
  # and it's not enough for the hash and salt
  def password=(password)
    self.password_digest = Bcrypt::Password.create(password)
  end
end
