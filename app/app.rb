require 'sinatra/base'
require './app/data_mapper_setup'
require 'sinatra/flash'
class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = user.errors.full_messages
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
      erb :index
    else
      flash.now[:errors] = ['This email or password are incorrect']
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.now[:notice] = 'Logged out'
    erb :index
  end

  def current_user
    User.get(session[:user_id])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
