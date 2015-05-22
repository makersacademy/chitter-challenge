require 'sinatra'
require 'data_mapper'

require_relative 'models/user'
require_relative 'models/peep'

require_relative 'controllers/application'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative 'models/user'

DataMapper.finalize
DataMapper.auto_upgrade!