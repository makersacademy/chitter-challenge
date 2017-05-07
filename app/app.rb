ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/home' do
    @users = User.all
    erb :feed
  end

  get '/sign-up' do
    @user = User.new()
    erb :'users/new'
  end

  post '/sign-up' do
    @user = User.create(email: params[:email],
                name: params[:name],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/home'
    else
      flash.now[:notice] = "Uh-oh, the passwords don't match"
      erb :'users/new'
    end
  end



  run! if app_file == $0
end
