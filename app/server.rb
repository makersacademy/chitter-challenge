require 'sinatra'
require 'thin'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'models/user'
require_relative 'models/peep'

require_relative 'controllers/application'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
require_relative 'controllers/peeps'

require_relative 'helpers/application'
require_relative 'data_mapper_setup'

enable :sessions
set :session_secret, 'my unique encryption key!'
set :partial_template_engine, :erb

use Rack::Flash
use Rack::MethodOverride