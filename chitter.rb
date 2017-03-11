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

  post "/users" do
    User.create(email: params[:email], password: params[:password])
    session[:user_id] = User.id
    User.id
    redirect to('/peeps')
  end

  get "/peeps" do
    erb(:peeps)
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
