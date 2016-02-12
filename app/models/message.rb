require 'data_mapper'
require 'dm-postgres-adapter'

class Message

  include DataMapper::Resource

  property :id, Serial
  property :text, String
  property :username, String
  property :time, String

end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}" )
DataMapper.finalize
DataMapper.auto_upgrade!
