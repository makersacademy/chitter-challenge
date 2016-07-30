require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id,   Serial
  property :email, String
  property :password_digest, String, length: 60

  # We cannot directly store the input password to the database, so instead
  # store the hash (password_digest) which is encrypted from the original
  # password here using bcrypt:
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
