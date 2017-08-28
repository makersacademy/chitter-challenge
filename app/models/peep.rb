require 'data_mapper'
require 'dm-postgres-adapter'
require_relative '../data_mapper_setup'

class Peep
  include DataMapper::Resource

  property :id,     Serial
  property :body,   String
  property :time,   DateTime
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_challenge_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
