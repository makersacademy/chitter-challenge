ENV["SINATRA_ENV"] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
  set :database, 'sqlite3:db/chitter_challenge.db'
end

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/chitter_challenge.db"
)

require_relative 'app'