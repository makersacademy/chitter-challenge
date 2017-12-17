DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'
require 'time'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email_address, String
  property :password, Text
end

DataMapper.finalize
DataMapper.auto_upgrade!
