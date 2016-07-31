require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  attr_reader :time

  property :id,   Serial
  property :post, String
  property :time, DateTime

end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
