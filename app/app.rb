require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    @user = User.get session[:user_id]
    erb :welcome
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    user = User.new(
      email:                 params['email'],
      password:              params['password'],
      password_confirmation: params['password_confirmation']
    )
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate params[:email], params[:password]
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id]  = nil
    flash.now[:notice] = "You are now logged out."
    redirect '/'
  end

  helpers do
    def current_user
      @id ||= User.get session[:user_id]
    end
  end
end
