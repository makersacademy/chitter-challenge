require "data_mapper"

ENV['RACK_ENV'] ||= 'development'

require_relative './app/app.rb'

run ChitterApp
