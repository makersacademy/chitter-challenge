require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Comment

  include DataMapper::Resource

  property :id, Serial
  property :comment, String, :length => 240
  property :created_at, DateTime

end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['ENVIRONMENT']}")
DataMapper.finalize
DataMapper.auto_upgrade!
