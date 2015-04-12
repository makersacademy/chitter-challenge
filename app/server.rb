require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require 'byebug'
require_relative 'models/user'
require_relative 'models/peep'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  configure do
    register Sinatra::Partial
    set :partial_template_engine, :erb
  end

  include Helpers

  enable :sessions
  set :session_secret, 'super secret'

  use Rack::Flash
  use Rack::MethodOverride

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end

require_relative 'controllers/application.rb'
require_relative 'controllers/sign_up.rb'
require_relative 'controllers/log_in.rb'
require_relative 'controllers/reset_password.rb'
require_relative 'controllers/peep.rb'
require_relative 'controllers/comment.rb'
require_relative 'controllers/profile.rb'
require_relative 'controllers/follow.rb'
require_relative 'controllers/message.rb'
