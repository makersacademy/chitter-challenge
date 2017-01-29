ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

 register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    @user = User.new
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], name: params[:name], username: params[:username])
    redirect '/feed'
  end

  get '/feed' do
    @name = User.first(username: params[:username])
    erb :'main/feed'
  end

  post '/userfeed' do
    @user = User.first(username: params[:username])
    erb :'main/userfeed'
  end

  get '/login' do
    erb :'main/login'
  end

  get '/logout' do
    redirect '/feed'
  end

  #post '/loginer' do
  #  user = User.first(username: params[:username])
  #  redirect '/feed'
  #end


  run! if app_file == $0

end
