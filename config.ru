require 'sinatra'
require_relative 'app/app'
require_relative 'app/controllers/peeps_controller'
require_relative 'app/controllers/users_controller'
require_relative 'app/controllers/sessions_controller'

use PeepsController
use UsersController
use SessionsController
run ChitterApp
