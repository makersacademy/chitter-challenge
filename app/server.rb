require 'sinatra'
require 'data_mapper'
require 'rack-flash'

require_relative 'data_mapper_setup'

require_relative 'models/note'

require_relative 'helpers/application'

require_relative 'controllers/application'
require_relative 'controllers/notes'
require_relative 'controllers/users'
require_relative 'controllers/sessions'

enable :sessions
set :session_secret, 'super_secret'

use Rack::Flash
