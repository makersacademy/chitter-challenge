require 'simplecov'
require 'simplecov-console'
require_relative "../repositories/database_connection"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::Console])
SimpleCov.start

ENV['ENV'] = 'test'

DatabaseConnection.connect
