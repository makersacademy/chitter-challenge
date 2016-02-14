ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/peeps' do
    erb :peeps
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name],
                       username: params[:username],
                       email: params[:email],
                       password: params[:password],
                       :password_confirmation => params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
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
        redirect to('/link')
      else
        flash.now[:error] = 'Email or password is incorrect'
        erb :'sessions/new'
      end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Bye! Come back soon.'
    redirect to '/sessions/new'
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  run! if app_file == $0
end
