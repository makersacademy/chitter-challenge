require 'rubygems'
require File.join(File.dirname(__FILE__), './app/app.rb')

DataMapper::Property::String.length(140)

run ChitterApp
