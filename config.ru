require 'sinatra'
require './app'
require './controllers/peep_controller'
require './controllers/user_controller'

use PeepController
use UserController

run Chitter
