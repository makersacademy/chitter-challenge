require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

Datamapper.setup(:default, "postgress://localhost/chitter#{env}")

require './app/models/peeps'

DataMapper.finalize

DataMapper.auto_upgrade!