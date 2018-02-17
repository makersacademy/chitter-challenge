require 'data_mapper'
require 'dm-postgres-adapter'

class Comment

  include DataMapper::Resource

  property :id, Serial
  property :comment, String

end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['ENVIRONMENT']}")
DataMapper.finalize
DataMapper.auto_upgrade!
