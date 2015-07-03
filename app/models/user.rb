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

  def self.authenticate(email:, password:) # clearly there is an issue here.. but let's wait until we have a test that targets it
    user = User.first(email: email)

    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
