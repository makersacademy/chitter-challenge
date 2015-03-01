require 'sinatra'
require 'sinatra/partial'
require 'data_mapper'
require 'rack-flash'
require 'date'


require_relative 'helpers/application'
require_relative 'models/hoot'
require_relative 'models/user'


require_relative 'data_mapper_setup'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/hoots'
require_relative 'controllers/application'



  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  set :partial_template_engine, :erb


