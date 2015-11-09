ENV['RACK_ENV'] ||= 'development'
require 'rubygems'
require 'data_mapper'
require 'dm-postgres-adapter'
require File.join(File.dirname(__FILE__), 'app/app.rb')

run Chitter
