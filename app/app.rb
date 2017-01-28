ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class ChitterChallenge < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'

  get '/' do
    # redirect '/'
  end

  get '/homepage' do
    erb :'homepage'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])
    if (@user)
      session[:user_id] = @user.id
      redirect '/homepage'
    else
      flash.now[:notices] = ["E-mail or password are incorrect."]
      erb :'sessions/new'
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], username: params[:username], name: params[:name])
    if @user.save
      session[:user_id] = @user.id
      erb :'homepage'
    else
      flash.now[:notices] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
