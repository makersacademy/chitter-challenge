ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
    @current_user = User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name], user_name: params[:user_name],email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = @user.id
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
