
ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
enable :sessions
set :session_secret, 'super secret'
register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/' do
    redirect '/messages'
  end

  get '/user/new' do
    @user = User.new
    erb :new_user
  end

  post '/users' do
    @user = User.create(name: params[:name], email: params[:email], user_name: params[:user_name], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/messages'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :new_user
    end
  end

  get '/messages' do
    erb :messages
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
