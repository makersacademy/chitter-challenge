require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class User

  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email, String
  property :password, String

end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['ENVIRONMENT']}")
DataMapper.finalize
DataMapper.auto_upgrade!
