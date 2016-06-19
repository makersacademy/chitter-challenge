require 'data_mapper'
require 'dm-postgres-adapter'

class Post

  include DataMapper::Resource

  property :id,     Serial
  property :peep,  String
  property :author, String
  property :created_at, DateTime

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
