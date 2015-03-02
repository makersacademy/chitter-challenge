env = ENV['RACK_ENV'] || 'development'
require './app/models/user'
require './app/models/peep'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!