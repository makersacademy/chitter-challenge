require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, Text
  #here
  # has n, :peeps

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
    # return this user
      user
    else
      nil
    end
  end

end
