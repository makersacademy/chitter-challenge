require 'bcrypt'
require 'dm-core'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, Text

  # def password=(password)
  #   self.password_digest = BCrypt::Password.create(password)
  # end

  def self.authenticate(email, password)
    user = User.first(email: email)
  end

end
