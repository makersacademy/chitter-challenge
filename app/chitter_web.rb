require 'sinatra/base'
require './data_mapper_setup'
require 'sinatra/flash'

class ChitterWeb < Sinatra::Base
  set :views, proc { File.join(root, 'views') }
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
        session[:user_id] = @user.id
        redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do

    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['Incorrect email/password']
      erb :'sessions/new'
    end
  end

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end

  delete '/sessions' do
    session.clear
    flash.next[:notice] = 'Goodbye!'
    redirect to('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
