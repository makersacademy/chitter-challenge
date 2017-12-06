require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,    Serial
  property :name, String
  property :email, String
  property :username, String
  property :password_digest, Text

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

  has n, :peeps, :through => Resource

end
