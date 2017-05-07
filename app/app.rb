ENV["RACK_ENV"] ||= "development"

require "sinatra/base"
require_relative "data_mapper_setup"
require "sinatra/flash"

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  #set: session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/users' do
    p params
    @users = User.all
    erb :'users/list'
  end

  post '/users' do
    user = User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/users'
    else
      flash.now[:notice] = "Password and password confirmation do not match"
      erb :'users/new'
    end
  end

  get '/users/new' do
    erb :'users/new'
  end

end
