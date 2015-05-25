require 'bcrypt'
class User

  include DataMapper::Resource

  has n, :peep

  property :id, Serial

  property :name, String
  property :username, String, unique: true, message: "This username has been taken"
  property :email, String, unique: true, message: "This email has been registered"
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

end
