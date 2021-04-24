require './app/controllers/application_controller'

use Rack::MethodOverride

run ApplicationController
