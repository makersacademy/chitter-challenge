# file: config.ru

require 'rubygems'
require 'bundler'

Bundler.require 

require './app'
run Application