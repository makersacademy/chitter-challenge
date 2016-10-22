require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

  property :id,              Serial
  property :username,        String
  property :name,            String
  property :email,           String
  property :password_digest, Text

end



DataMapper::Logger.new($stdout, :debug)
# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres:///chitter_#{ENV['RACK_ENV']}")
DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
