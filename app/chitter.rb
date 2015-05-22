require 'data_mapper'
require 'sinatra'
require 'sinatra/partial'
require 'rack-flash'

#MODEL SET-UP
require_relative 'models/user'
require_relative 'models/peep'
require_relative 'database_setup' #at end, after load models

require_relative 'helpers/current_user'

#CONTROLLER SET-UP
require_relative 'controllers/application'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'

#SINATRA CONFIG
enable :sessions
set :session_secret, 'super_secret'
set :public_folder, 'public'
use Rack::Flash