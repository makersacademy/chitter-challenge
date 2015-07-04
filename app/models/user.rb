require 'bcrypt'
require 'data_mapper'

class User

  include DataMapper::Resource

  attr_reader :password

  property :id, Serial
  property :email, String
  property :name, String
  property :username, String
  property :password_digest, Text

  has n, :peeps, through: Resource

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username:, password:)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
