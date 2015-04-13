require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/partial'
require 'data_mapper'
require 'rack-flash'

require_relative 'models/peep'
require_relative 'models/user'

require_relative 'data_mapper_setup'

require_relative 'helpers/application'

class Chitter < Sinatra::Base

  configure do
    register Sinatra::Reloader

    register Sinatra::Partial
    set :partial_templete_engine, :erb
  end

  enable :sessions
  set :session_secret, 'super secret'

  use Rack::Flash
  use Rack::MethodOverride

  include Helpers

  run! if app_file == $PROGRAM_NAME

end

require_relative 'controllers/application'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'

