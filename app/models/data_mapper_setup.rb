heroku = ENV['DATABASE_URL']
env = ENV['RACK_ENV'] || 'development'
local = "postgres://localhost/chitter_#{env}"
DataMapper.setup(:default, heroku || local)
require_relative 'user'
require_relative 'cheep'
require_relative 'applause'
DataMapper.finalize
# require 'database_cleaner'
DataMapper.auto_migrate!
# DatabaseCleaner.strategy = :transaction
# DatabaseCleaner.clean