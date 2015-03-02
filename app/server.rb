require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require_relative 'models/chit.rb'
require_relative 'models/user.rb'
require_relative 'helpers/application.rb'
require_relative 'data_mapper_setup'

require_relative 'controllers/chits_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/index_controller'

set :public_folder, Proc.new { File.join(root, '..', "public") }
set :views, Proc.new { File.join(root, "views") }

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
use Rack::MethodOverride



