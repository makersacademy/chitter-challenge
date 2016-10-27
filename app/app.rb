ENV['RACK_ENV'] ||= "development"
require "sinatra/base"
require "sinatra/flash"
require "sinatra/partial"
require_relative "models/peep"
require_relative "models/user"
require_relative "models/data_mapper_setup"
require_relative "controllers/peeps"
require_relative "controllers/users"
require_relative "controllers/sessions"

data_mapper_configure

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  set :root, File.dirname(__FILE__)
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end



  get '/' do
    redirect '/peeps'
  end













  # start the server if ruby file executed directly
  run! if app_file == $0
end
