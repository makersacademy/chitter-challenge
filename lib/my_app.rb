ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'makers agents'

  helpers do
    def current_user
        @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :'users/new'
  end

  post '/signup' do
    @user = User.new(name: params[:name],
                    username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/welcome')
    else
      #flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/new'
    end
  end

  get '/welcome' do
    erb :welcome
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
