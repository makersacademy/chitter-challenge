require 'sinatra/base'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/partial'
require 'data_mapper'
require 'rack-flash'

require_relative 'data_mapper_setup'
require_relative 'helpers/application'
require_relative 'models/user'
require_relative 'models/peep'

require_relative 'controllers/users'
# require_relative 'controllers/peep'
require_relative 'controllers/application'


class Chitter < Sinatra::Base

  configure :production do
    enable :reloader
  end

  enable :sessions
  set :session_secret, 'super secret'

  use Rack::Flash
  # use Rack::MethodOverride

  register Sinatra::Partial
  set :partial_templete_engine, :erb

end