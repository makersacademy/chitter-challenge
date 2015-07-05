require 'sinatra/base'
require './lib/data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  enable :sessions
  set :views, proc { File.join(root, '.', 'views') }

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email:    params[:email],
                        username: params[:username],
                        password: params[:password])
    if @user.save
      session[:username] = params[:username]
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  get '/sessions' do
    erb :'sessions/sessions'
  end

  delete '/sessions' do
    session.clear
    flash.next[:notice] = 'Logged out'
    redirect to '/'

  end

  post '/sessions' do
    @user = User.authenticate_user(params[:username], params[:password])
    if @user
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect to '/sessions'
      erb :sessions
    else
      flash.next[:errors] = ['The username or password is incorrect']
      erb :'sessions/new'
    end
  end

  helpers do
    def current_user
      session[:username]
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
