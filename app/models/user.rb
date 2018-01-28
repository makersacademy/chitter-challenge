require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
    include DataMapper::Resource

    property :id, Serial
    property :username, String
    property :email, String
    property :password_digest, Text

    has n, :peeps

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

end
