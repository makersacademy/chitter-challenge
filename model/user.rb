require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password, String

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
