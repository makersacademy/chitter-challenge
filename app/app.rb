ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require 'pry'

require_relative 'controllers/peep_controller'
require_relative 'controllers/user_controller'
require_relative 'controllers/session_controller'

class Chitter < Sinatra::Base

  set :root, File.dirname(__FILE__)

  use Rack::MethodOverride

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/peeps'
  end

  run! if app_file == $0
end
