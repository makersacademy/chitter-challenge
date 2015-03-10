require 'sinatra'
require 'sinatra/partial'
require 'data_mapper'
require 'rack-flash'
require './app/lib/tweet'
require './app/lib/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'
require_relative 'controllers/application'
require_relative 'controllers/tweets'
require_relative 'controllers/sessions'
require_relative 'controllers/users'

set :public_folder, Proc.new { File.join(root, "..", "public") }

enable :sessions
set :session_secret, 'super awesome secret password'
use Rack::Flash
use Rack::MethodOverride