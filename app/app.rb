ENV['RACK_ENV'] ||= 'development'
RACK_ENV = ENV['RACK_ENV']
require 'sinatra/base'
require 'sinatra/flash'
require 'tilt/erb'
require_relative 'data_mapper_setup'
require 'bcrypt'
require_relative './models/poop'
require_relative './models/user'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super_secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :home
  end

  get '/users/new' do
#    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    user = User.create(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username]
    )
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/'
    else
      flash.now[:notice] = "email and password is not recognized"
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye'
    redirect to '/'
  end

  get '/poops/new' do
    @poop = Poop.new
   # if session[:user_id]
      erb :'poops/new'
    #else
      #redirect '/'
   # end
  end

  post '/poops' do
    p "THIS THIS THIS THIS"
    poop = Poop.create(poop_msg: params[:poop_msg])
    poop = current_user.poops.create(
      poop_msg: params[:poop_msg]
    )
    p "WHAT THE FUCK"
   redirect '/poops/index'
  end


  get '/poops/index' do
    erb :'poops/index'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
