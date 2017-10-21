require 'data_mapper'
require 'dm-postgres-adapter'

# :nodoc:
class Post
  include DataMapper::Resource

  property :id,     Serial
  property :tip,    String
end

DataMapper.setup(:default, "postgres://localhost/fitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
