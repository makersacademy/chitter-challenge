heroku = ENV['DATABASE_URL']
env = ENV['RACK_ENV'] || 'development'
local = "postgres://localhost/chitter_#{env}"
DataMapper.setup(:default, heroku || local)
require_relative 'user'
DataMapper.finalize
