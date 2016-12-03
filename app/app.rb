ENV['RACK_ENV']||='development'
require 'sinatra/base'
require 'pry'
require_relative  './models/user.rb'
require_relative './models/database_setting.rb'
require 'dm-core'
require 'sinatra'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride


  helpers do
    def current_user
      User.first(id: session[:id])
    end
  end

  before do
    @user = current_user
  end

  get '/' do
    erb :index
  end

  get '/sessions' do
    erb :'sessions/index'
  end

  post '/sessions' do
    user = User.authenticate(params[:user_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:notice] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], user_name: params[:user_name],
    email: params[:email], password: params[:password])
    if user.save
      session[:id] = user.id
      redirect '/'
    else
      flash.now[:notice] = "Email is already taken"
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  delete '/sessions' do
    session[:id] = nil
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
