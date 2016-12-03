require 'data_mapper'
require 'dm-postgres-adapter'

class Tweet

  include DataMapper::Resource

  property :id, Serial
  property :tweet, Text

end

DataMapper.setup(:default, "postgres://localhost/twitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
