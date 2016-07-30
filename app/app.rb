ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions

  use Rack::MethodOverride

  register Sinatra::Flash

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(user_name:       params[:user_name],
                    email:           params[:email],
                    password:        params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/cheeps/index'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/cheeps/index' do
    erb :'cheeps/index'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/cheeps/index')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to('/cheeps/index')
  end


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
