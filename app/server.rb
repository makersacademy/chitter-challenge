require 'data_mapper'
require 'sinatra'
require 'rack-flash'
require 'sinatra/partial'
require './app/models/peep'
require './app/models/hashtag'
require './app/models/maker'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

require_relative 'controllers/makers'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'
require_relative 'controllers/hashtags'
require_relative 'controllers/application'


enable :sessions
set :session_secret, 'top secret'
use Rack::Flash
set :partial_template_engine, :erb













