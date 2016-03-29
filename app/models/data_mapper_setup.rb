require_relative 'user'
require_relative 'peep'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.auto_migrate! if ENV['RACK_ENV'] == 'test'
DataMapper.finalize
