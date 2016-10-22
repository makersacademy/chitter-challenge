ENV['RACK_ENV'] = 'development'
require 'sinatra/base'
require 'sinatra/flash'
require './models/data_mapper_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect 'users/new'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(user_name: params[:user_name],
    name: params[:name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:notice] = "Your passwords do not match, please try again!"
      erb :'users/new'
    end
  end

  get '/peeps' do
    erb :'/welcome'
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
