require 'bcrypt'
class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :handle, String, unique: true, message: 'This username is already taken'
  property :email, String, unique: true, message: 'This email is already in use on a account'
  property :password_digest, Text

  def username=(username)
    username[0] == '@' ? self.handle = username : self.handle = "@#{username}"
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
