require 'sinatra'

require_relative './app'

use Rack::MethodOverride
run ChitterApp
