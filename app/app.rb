ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'bcrypt'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :'/posts/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create( name: params[:name],
                         username: params[:username],
                         email: params[:email],
                         password: params[:password],
                         password_confirmation: params[:password_confirmation])
    session[:user_id] = @user.id
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
