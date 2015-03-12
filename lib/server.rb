require 'data_mapper'
require 'sinatra'
require './lib/helpers/application'
require 'rack-flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'


require_relative 'models/peep'
require_relative 'models/user'


require_relative 'controllers/application'
require_relative 'controllers/users'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'


enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
use Rack::MethodOverride
set :partial_template_engine, :erb
