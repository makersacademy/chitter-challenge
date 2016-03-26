ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'pry'
require 'sinatra/flash'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/users/new' do
     @user = User.new
     erb :'/users/new'
  end


  post '/signup' do
    @user = User.new(name: params[:name], email: params[:email],
                    username: params[:username], password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps/index'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'/users/new'
    end
  end

  get '/peeps/index' do
    erb :'peeps/index'
  end

   helpers do
   def current_user
      @current_user ||= User.get(session[:user_id])
    end
   end

    run! if app_file == $0

end
