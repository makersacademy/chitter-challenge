require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, Text # Saved as text because string doesn't hold enough characters for hash and salt.
  # Password isn't stored directly, its stored as a password digest provided by bcrypt.

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
