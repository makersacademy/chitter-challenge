require 'data_mapper'

#require_relative 'lib/chitter.rb'

env = ENV['RACK_ENV'] || 'developement'

DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")


DataMapper.finalize

DataMapper.auto_upgrade!
