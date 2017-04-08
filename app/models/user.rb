require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User
  
  include DataMapper::Resource
  attr_reader :password

  property :id, Serial
  property :email, String

  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end

DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
