require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :username, String
  property :email,    String
  property :password, String
end

DataMapper::Logger.new(STDOUT, :debug) if ENV['RACK_ENV'] == 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] ||
"postgres://localhost/chitter_#{ENV['RACK_ENV']}")

DataMapper.finalize

DataMapper.auto_upgrade!
