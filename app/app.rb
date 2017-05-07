ENV["RACK_ENV"] ||= "development"

require "sinatra/base"
require_relative "data_mapper_setup"
require "sinatra/flash"

class Chitter < Sinatra::Base

  register Sinatra::Flash
  use Rack::MethodOverride

  enable :sessions
  set :sessions_secret, 'super_secret'

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

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/users')
    else
      flash.now[:errors] = ['Your email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'You have signed out of Chitter!'
    redirect to('/users')
  end

end
