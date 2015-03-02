require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require './app/models/peep'
require './app/models/user'
require './app/data_mapper_setup'
require_relative 'helpers/current_user'
require_relative 'controllers/application'
require_relative 'controllers/peeps'
require_relative 'controllers/users'
require_relative 'controllers/sessions'

enable :sessions
set :session_secret, 'super secret'
set :root, File.dirname(__FILE__)
set :views, Proc.new { File.join(root, '/views')}
use Rack::MethodOverride
use Rack::Flash
helpers CurrentUser