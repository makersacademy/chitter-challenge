require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Post
  include DataMapper::Resource

  property :id, Serial
  property :body, String
  property :created_at, DateTime

end

DataMapper.setup(:default, "postgres://localhost/blabber_#{ENV['RACK_ENV']}")

DataMapper.finalize

DataMapper.auto_upgrade!
