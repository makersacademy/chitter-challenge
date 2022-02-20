require 'sinatra'
require './app'
# Multiple Controllers is a work in progress
# I am having issues with RSpec tests passing

require './controllers/peep_controller'

use PeepController

run Chitter
