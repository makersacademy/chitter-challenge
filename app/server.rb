require 'data_mapper'
require 'rack-flash'
require 'sinatra/base'
require 'sinatra/partial'
require 'tilt/erb'

require_relative 'helpers/application'

require_relative 'models/peep'
require_relative 'models/user'

env = ENV['RACK_ENV'] || 'development'
postvar = "postgres://localhost/chitter_#{env}"
DataMapper.finalize
DataMapper.setup(:default, ENV['DATABASE_URL'] || postvar)
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

  set :public_folder, proc { File.join(root, "..", "public") }

  configure do
    register Sinatra::Partial
    set :partial_template_engine, :erb
  end

  enable :sessions
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  use Rack::Flash
  use Rack::MethodOverride

  include Helpers

  run! if app_file == $PROGRAM_NAME

end

require_relative 'controllers/application'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
