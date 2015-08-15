require 'sinatra/base'
require_relative "../data_mapper_setup"
require_relative "./models/user"
require 'sinatra/session'
require 'sinatra/flash'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  #register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end
  #
  post '/users' do
    @user = User.new(email: params[:email],
    password: params[:password],
    first_name: params[:first_name],
    last_name: params[:first_name],
    username: params[:username])
    @user.save
    session[:user_id] = @user.id
    redirect to('/')
  end

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
