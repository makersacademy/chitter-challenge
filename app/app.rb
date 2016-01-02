ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'models/data_mapper_setup'
require 'byebug'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial

  enable :sessions
  enable :partial_underscores

  set :session_secret, "secret message"
  set :partial_template_engine, :erb

  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirm])
    if @user.id
      session[:user_id]=@user.id
      redirect '/'
    else
      flash.now[:error]=@user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id]=user.id
      flash.next[:success]='You are now logged in.'
      redirect '/'
    else
      flash.now[:notice]='The email or password was incorrect'
      erb :'/sessions/new'
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
