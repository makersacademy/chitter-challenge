require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, Text
  property :username, String, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end

# email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).

# The username and email are unique.

# Use bcrypt to secure the passwords.
