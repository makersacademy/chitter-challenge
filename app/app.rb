require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Hello Chitter!'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
     @user = User.create(name: params[:name],
                        user_name: params[:user_name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/cheeps'
    else
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    redirect to('/cheeps')
  end

  get '/cheeps' do
    erb :'cheeps/home'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
