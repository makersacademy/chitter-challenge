ENV["SINATRA_ENV"] ||= "development"

require 'bundler/setup'
require 'sinatra/contrib'

Bundler.require(:default, ENV['SINATRA_ENV'])

if ENV['SINATRA_ENV'] == 'test'
  ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "db/chitter_db_test.db"
  )
elsif ENV['SINATRA_ENV'] == 'development'
  ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "db/chitter_db.db"
  )
end

require './app'