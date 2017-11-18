require 'data_mapper'
require 'dm-postgres-adapter'

# require_relative '../app.rb'

class Peep
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
  include DataMapper::Resource

  property :id, Serial
  property :message, String
end

DataMapper::Logger.new($stdout, :debug)

DataMapper.finalize
DataMapper.auto_upgrade!
