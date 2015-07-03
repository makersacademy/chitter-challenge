require 'data_mapper'
require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password

  property :id, Serial
  property :username, String, unique: true, message: 'This username is already taken'
  property :name, String
  property :email, String, unique: true, message: 'This email already exits, trying signing in'
  property :password_digest, Text, :lazy => false

  def password=(pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(pass)
  end

  def self.authenticate(username:, password:)
    user = User.first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
