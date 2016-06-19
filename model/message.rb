require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'

class Message
  include DataMapper::Resource
  property :id, Serial
  property :message, String
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_chatter_#{ENV['RACK_ENV']}")

DataMapper.finalize
DataMapper.auto_upgrade!
