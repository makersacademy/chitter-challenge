require './app/app'
require './app/datamapper_setup'

run Chitter

ENV['RACK_ENV'] ||= 'development'
