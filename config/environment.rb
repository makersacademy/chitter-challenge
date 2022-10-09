ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'active_record'

Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(ENV['SINATRA_ENV'].to_sym)

require_all 'app'
