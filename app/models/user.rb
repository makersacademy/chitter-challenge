require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :password_hash, Text
  property :name, String
  property :username, String

  def pass=(password)
    self.password_hash = BCrypt::Password.create(password)
  end

end



DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
DataMapper.auto_upgrade!
