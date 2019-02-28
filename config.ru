require_relative './app.rb'
require 'active_record'
require './config.rb'

config = config[ENV['RACK_ENV']]
ActiveRecord::Base.establish_connection(config[:db_url])

run Chitter
