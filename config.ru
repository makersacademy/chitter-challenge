require 'sinatra'
require './app'
# Multiple Controllers is a work in progress
# I am having issues with RSpec tests passing
# require_relative './peeps_controller'

# use PeepsController
run Chitter
