ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require "./app/models/user"
require "./app/models/peep"
require "./app/models/comment"
require "./app/models/mailgun"
require_relative "datamapper_setup"
require 'sinatra/flash'
require "dotenv"
Dotenv.load
require_relative "controllers/users"
require_relative "controllers/sessions"
require_relative "controllers/peeps"
require_relative "controllers/comments"


class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  set :app_file, __FILE__
  register Sinatra::Flash

  get '/' do
    redirect to('/peeps')
  end

  get "/log-in" do
    erb(:log_in)
  end

  helpers do

    def log_in(user)
      session[:user_id] = user.id
      redirect to("/users/#{user.id}")
    end

    def current_user?(user)
      current_user == user
    end

    def current_user
      @user = User.get(session[:user_id])
    end

    def logged_in?
      !session[:user_id].nil?
    end

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
