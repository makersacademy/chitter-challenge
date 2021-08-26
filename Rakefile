require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

ENV["SINATRA_ENV"] ||= "development"
ENV["RACK_ENV"] ||= "development"
ENV["DATABASE_ENV"] ||= "development"
ENV["RAILS_ENV"] ||= "development"


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