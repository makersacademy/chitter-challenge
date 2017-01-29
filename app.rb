ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './models/user.rb'
require 'sinatra/flash'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    email = params[:email]
    name = params[:name]
    user_name = params[:user_name]
    password = params[:password]
    @user = User.create(email: email,
                        name: name,
                        user_name: user_name,
                        password: password)
    session[:user_id] = @user.id
    erb :sign_up
  end

  get '/sessions_new' do
    erb :sessions_new
  end

  post '/sessions' do
    @user = User.authenticate(params[:user_name], params[:password])
    if @user
      session[:user_id] = @user.id
      erb :sessions_new
    else
      flash.now[:errors] = ['The user_name or password is incorrect']
      erb :sessions_new
    end
  end
    delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    #redirect to '/links'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
