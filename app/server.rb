require 'sinatra'
require 'data_mapper'
require './app/models/peep'
require 'rack-flash'
require 'sinatra/partial'
require_relative 'models/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/application'
require_relative 'controllers/peeps'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride
  register Sinatra::Partial
  set :partial_template_engine, :erb
  set :views, Proc.new { File.join("./app/views") }

  run! if app_file == $0

end