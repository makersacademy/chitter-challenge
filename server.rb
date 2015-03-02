require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require './models/chit'
require './models/user'
require './helpers/application'
require_relative 'data_mapper_setup'

require_relative 'controllers/chits_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/index_controller'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
use Rack::MethodOverride



