require 'rubygems'
require File.join(File.dirname(__FILE__), 'app/chitter.rb')

root = ::File.dirname(__FILE__)
require ::File.join( root, 'chitter' )

run Chitter
