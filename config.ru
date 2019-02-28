require_relative './app.rb'
require 'active_record'
require './config.rb'

config = Config.read_config('production')
ActiveRecord::Base.establish_connection(config[:db_url])

run Chitter
