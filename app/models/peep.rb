require 'data_mapper'
require 'dm-postgres-adapter'
# require './data_mapper_setup'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :subject, String
  property :peep, Text
  property :created_at, DateTime
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
