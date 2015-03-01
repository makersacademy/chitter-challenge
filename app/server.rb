require 'sinatra'
require 'thin'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'models/user'
require_relative 'data_mapper_setup'

enable :sessions
set :session_secret, 'my unique encryption key!'
set :partial_template_engine, :erb


use Rack::Flash
use Rack::MethodOverride