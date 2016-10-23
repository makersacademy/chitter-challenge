ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative "models/data_mapper_setup"
require_relative 'models/user'
require_relative 'models/peep'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  database_setup

  get "/" do
    erb :index
  end

  get "/sign_in" do
    erb :sign_in
  end

  post "/sign_in" do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect "/"
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
