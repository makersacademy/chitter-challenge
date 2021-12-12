require 'sinatra'
require_relative 'app/app.rb'
require_relative 'app/controllers/peeps_controller.rb'
require_relative 'app/controllers/users_controller.rb'
require_relative 'app/controllers/sessions_controller.rb'

use PeepsController
use UsersController
use SessionsController
run ChitterApp
