require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
# class Peep
class Peep
  attr_reader :time

  include DataMapper::Resource
  property :id,       Serial
  property :content,  String
  property :created_at, DateTime

end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
