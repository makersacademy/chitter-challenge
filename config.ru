# require_relative "./app"
require './app'
use Rack::MethodOverride
run ChitterApp
