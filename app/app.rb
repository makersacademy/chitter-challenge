ENV['RACK_ENV'] ||= 'development'

require 'dotenv'
Dotenv.load

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'models/peep'
require_relative 'models/user'
require_relative 'models/tag'
require_relative 'models/reply'

require_relative 'data_mapper_setup'
require_relative 'mail_setup'

require_relative './helpers/chitter_helpers'

require_relative './helpers/chitter_helpers'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'

  helpers ChitterHelpers

  get '/' do
    erb :index
  end

  # run! if $0 == $
end

require_relative 'controllers/tags'
require_relative 'controllers/replys'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'
