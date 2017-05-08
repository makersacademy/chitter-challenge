ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'secret'

  register Sinatra::Flash

  get '/' do
    erb :homepage
  end
  post '/users' do
    user = User.create(name: params[:name],
                       email: params[:email],
                       user_name: params[:user_name],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/main'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      redirect '/'
    end
  end

  get '/login' do
    erb :login
  end

  post '/user' do
    user = User.authenticate(params[:user_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/main'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :login
    end
  end

  get '/main' do
    erb :main
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
