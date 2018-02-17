require 'rubygems'
require 'data_mapper'
require_relative 'database_connection_setup.rb'
require File.join(File.dirname(__FILE__), 'lib', 'cheet.rb')

if ENV['RACK_ENV'] == 'test'
  DataMapper.setup(:default, 'postgres:///cheeter_test')
else
  DataMapper.setup(:default, 'postgres:///cheeter')
end
