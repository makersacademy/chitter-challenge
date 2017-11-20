require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :time, String

end

DataMapper::Logger.new(File.dirname(File.absolute_path(__FILE__))+'/log.txt', :debug)
DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
