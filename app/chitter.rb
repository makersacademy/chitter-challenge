require 'sinatra/base'
require_relative "../data_mapper_setup"
require_relative "./models/user"
require 'sinatra/session'
require 'sinatra/flash'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end
  #
  post '/users' do
    @user = User.new(email: params[:email],
    password: params[:password],
    first_name: params[:first_name],
    last_name: params[:first_name],
    username: params[:username])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end

  get '/sessions/new' do
    # @user = User.new
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
