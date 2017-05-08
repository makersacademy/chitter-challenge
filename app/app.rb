ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup'
require_relative 'models/user/new.rb'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get "/" do
    @users = User.all
    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(username: params[:username],
                        email: params[:email],
                        password: params[:password],)
    session[:user_id] = user.id
    redirect '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end





  run! if app_file == $0

end
