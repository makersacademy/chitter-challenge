require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User

  attr_reader :password

  include DataMapper::Resource

  property :id,    Serial
  property :email, String
  property :password_digest, Text

  def password=(password)
   self.password_digest = BCrypt::Password.create(password)
 end


end

DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
