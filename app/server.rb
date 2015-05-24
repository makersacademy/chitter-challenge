require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

use Rack::Flash
use Rack::MethodOverride



enable :sessions
set :session_secret, '1wejka'
set :partial_template_engine, :erb


require_relative 'data_mapper_setup'
require_relative 'models/user'

require_relative 'controllers/application'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'helpers/application'



