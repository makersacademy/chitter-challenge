require 'rubygems'
# require './app/chitter_app.rb' Probably dont need this as used rspec-sinatra
require File.join(File.dirname(__FILE__), 'lib/chitter_app.rb')

run ChitterApp
