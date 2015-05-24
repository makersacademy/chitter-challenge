require 'sinatra'
require 'data_mapper'
require 'rack-flash'

use Rack::Flash

enable :sessions
set :session_secret, '1wejka'


require_relative 'data_mapper_setup'
require_relative 'models/user'

require_relative 'controllers/application'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'helpers/application'



