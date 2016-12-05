require 'data_mapper'
require 'dm-postgres-adapter'
require 'rake'
require './app/app.rb'
#require './spec/spec_helper.rb'

require_relative 'models/user'
require_relative 'models/peep'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
