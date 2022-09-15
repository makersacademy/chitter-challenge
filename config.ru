require 'bundler'
Bundler.require
require './config/environments/development'

require './db/seed'

require './app'
run Application