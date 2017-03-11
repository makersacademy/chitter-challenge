ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './models/dm_start'
require './models/user'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'secret'

  get "/" do
    erb(:homepage)
  end

  get "/create_account" do
    erb(:create_account)
  end

  post "/account_created" do
    User.create(email: params[:email], password: params[:password])
    session[:user_id] = User.id
    User.id
    erb(:logged_in)
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
