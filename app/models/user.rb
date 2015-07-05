require 'data_mapper'
require 'bcrypt'

class User

  include DataMapper::Resource
  attr_reader :password

  property :id, Serial
  property :email, String
  property :username, String
  property :password_digest, Text

  has n, :peeps

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email:, password:)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end