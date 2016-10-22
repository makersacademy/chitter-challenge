require 'sinatra/base'
require_relative './app/models/user'

class Chitter < Sinatra::Base


  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
     redirect to('/home')
   end

   get '/home' do
     erb(:home)
   end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  post '/users' do
    @user = User.create(username: params[:username],
                      name: params[:name],
                      email: params[:email],
                      password: params[:password])
    session[:user_id] = @user.id
    redirect to('/home')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
