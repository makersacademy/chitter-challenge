ENV['RACK_ENV'] ||= 'development'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-core'
require 'dm-timestamps'

DataMapper.setup(:default, 'postgres::memory:')

class Peep
  include DataMapper::Resource

  property :id,       Serial
  property :message,  String
  property :created_at, DateTime
  property :created_on, Date

end
