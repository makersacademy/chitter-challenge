env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
# Add the model requires
require './app/models/user'
require './app/models/peep'
DataMapper.finalize