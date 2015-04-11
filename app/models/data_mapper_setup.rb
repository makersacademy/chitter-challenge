heroku = ENV['DATABASE_URL']
env = ENV['RACK_ENV'] || 'development'
local = "postgres://localhost/chitter_#{env}"
DataMapper.setup(:default, local)
require_relative 'user'
DataMapper.finalize
DataMapper.auto_upgrade!