require 'sinatra/activerecord'
require './chitter/app'

DB_ENV ||= 'development'
connection_details = YAML::load(File.open('./config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details[DB_ENV])

require 'sinatra/activerecord/rake'