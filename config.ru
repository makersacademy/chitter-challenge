require 'rubygems'
require File.join(File.dirname(__FILE__), 'app/app.rb')


root = ::File.dirname(__FILE__)
require ::File.join( root, 'app/app' )

run Chitter
