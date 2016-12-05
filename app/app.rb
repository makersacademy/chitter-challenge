ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require './app/models/login'
require_relative 'data_mapper_setup.rb'


class Chitter < Sinatra::Base
  enable :sessions
  use Rack::MethodOverride
  register Sinatra::Flash
  register Sinatra::Partial

  set :partial_template_engine, :erb
  enable :partial_underscores

  get "/" do
    erb :index
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[user_id])
    end

    def date_and_time(time)
      time.strftime("%c")
    end
  end
  run! if app_file == $0
end

require_relative "controllers/users"
require_relative "controllers/sessions"
require_relative "controllers/peeps"
