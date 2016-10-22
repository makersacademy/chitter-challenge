require_relative 'models/user'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV["DATABASE_URL"] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
