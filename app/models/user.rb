require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,        Serial
  property :username, String
  property :email,     String
  property :password_digest,  Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate!
