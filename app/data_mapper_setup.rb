require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'


DataMapper.setup(:default, "postgres://localhost/chatter_#{env}")

require_relative 'server'

DataMapper.finalize

DataMapper.auto_upgrade!


# DataMapper.setup(:default, ENV['DATABASE_URL'] ||"postgres://localhost/bookmark_manager_#{env}")
