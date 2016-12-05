ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

require_relative 'controllers/peep_controller'
require_relative 'controllers/user_controller'
require_relative 'controllers/session_controller'

require_relative 'helpers'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :root, File.dirname(__FILE__)
  set :partial_template_engine, :erb

  enable :partial_underscores

  helpers Helpers

  get '/' do
    redirect '/peeps'
  end

  run! if app_file == $0
end
