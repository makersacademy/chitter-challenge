require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'tilt/erb'

require_relative 'data_mapper_setup'
require_relative 'helpers/application'
require_relative 'models/users'
require_relative 'models/messages'

require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/messages'

enable :sessions
set :session_secret, 'hidunLian'

use Rack::Flash
use Rack::MethodOverride

set :public_folder, 'public'

DataMapper.auto_upgrade!

get '/' do
  erb :index
end
