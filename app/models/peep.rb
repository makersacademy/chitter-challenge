require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

require_relative '../data_mapper_setup'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :mess, Text
  property :created_at, Time
end

DataMapper.finalize
DataMapper.auto_upgrade!
