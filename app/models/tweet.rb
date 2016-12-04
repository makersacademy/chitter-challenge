require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'


class Tweet

  include DataMapper::Resource

  property :id, Serial
  property :message, Text

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/twitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
