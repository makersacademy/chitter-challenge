# require 'rubygems'
# require './app/app'
# require File.join(File.dirname(__FILE__), '/app/app.rb')
#
# run Chitter

require 'rack'
require './app/app'
$stdout.sync = true
run Chitter
