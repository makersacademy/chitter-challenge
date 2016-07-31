ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require 'pry'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super duper secret muahaha'
  use Rack::MethodOverride

  register Sinatra::Flash

  helpers do
    def current_user
      @user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/feed'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(username: params[:username],
                      name: params[:name],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/feed'
    else
      flash.now[:error] = user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/feed'
    else
      flash.now[:error] = ["Incorrect username/password"]
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:notice] = "You have been logged out"
    redirect '/feed'
  end

  get '/feed' do
    @peeps = Peep.all(order: [ :created_at.desc ])
    erb :'feed/index'
  end

  post '/feed' do
    peep = Peep.new(message: params[:message])
    peep.user_id = current_user.id
    if peep.save
      flash[:notice] = "Peep peep!"
    else
      flash[:error] = peep.errors.full_messages
    end
    redirect '/feed'
  end

  # start the server if ruby file executed directly
#  run! if app_file == $PROGRAM_NAME
end
