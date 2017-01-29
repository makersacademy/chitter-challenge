ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './models/user.rb'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
   use Rack::MethodOverride

  get '/' do
    redirect '/timeline'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(name: params[:name],
                      email: params[:email],
                      username: params[:username],
                      password: params[:password])
    redirect '/timeline'
  end

  get '/timeline' do
    @username = session[:username]
    erb :timeline
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/timeline'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
  session[:user_id] = nil
  redirect to '/timeline'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
