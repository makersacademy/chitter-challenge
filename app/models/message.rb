require 'data_mapper'
require 'dm-postgres-adapter'

class Message

  include DataMapper::Resource

  property :id, Serial
  property :peep, Text
  property :name, String
  property :username, String
  property :posted_at, Text

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
