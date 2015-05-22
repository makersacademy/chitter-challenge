require 'sinatra'
require 'data_mapper'
require 'rack-flash'

require_relative 'data_mapper_setup'
require_relative 'helpers/application'
require_relative 'models/users'

require_relative 'controllers/users'

enable :sessions
set :session_secret, 'hidunLian'

use Rack::Flash
use Rack::MethodOverride

DataMapper.auto_upgrade!

get '/' do
  erb :index
end
