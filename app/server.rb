require 'data_mapper'
require 'sinatra'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'models/blabbs'
require_relative 'models/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

require_relative 'controllers/application'
require_relative 'controllers/blabbs'
require_relative 'controllers/sessions'
require_relative 'controllers/users'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
use Rack::MethodOverride
set :partial_template_engine, :erb
set :public_folder, 'public'
