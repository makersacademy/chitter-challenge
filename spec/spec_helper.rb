ENV['RACK_ENV'] = 'test'

require './app/server'
require 'coveralls'
Coveralls.wear!
