require 'rubygems'
require 'bundler'

Bundler.require

require File.expand_path 'app/app.rb', File.dirname(__FILE__)
run App
