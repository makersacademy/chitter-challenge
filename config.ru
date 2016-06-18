require 'rubygems'
require 'bundler'

Bundler.require

require File.join(File.dirname(__FILE__), 'app/app.rb')

run Chitter
