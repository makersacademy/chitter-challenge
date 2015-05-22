require 'data_mapper'
require 'sinatra'
require 'sinatra/partial'
require 'rack-flash'

#MODEL SET-UP
require_relative 'models/user'
require_relative 'models/peep'
require_relative 'database_setup' #at end, after load models
#CONTROLLER SET-UP
require_relative 'controllers/application'
require_relative 'controllers/users'

#SINATRA CONFIG
enable :sessions
set :session_secret, 'super_secret'
set :public_folder, 'public'
use Rack::Flash