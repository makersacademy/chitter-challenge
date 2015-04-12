require 'bcrypt'
class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  validates_confirmation_of :password

  property :id, Serial
  property :name, String
  property :handle, String, unique: true, message: 'This username is already taken'
  property :email, String, unique: true, message: 'This email is already in use on a account'
  property :password_digest, Text

  def username=(username)
    username[0] == '@' ? self.handle = username : self.handle = "@#{username}"
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
