require 'sinatra/base'
require 'sinatra/flash'
require_relative './app/models/user'

class Chitter < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash
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

   get '/sessions/new' do
     erb(:'/sessions/new')
   end

   post '/sessions' do
     user = User.authenticate(params[:username], params[:password])
     if user
       session[:user_id] = user.id
       redirect to('/home')
     else
       flash.now[:errors] = ['The email or password is incorrect']
       erb(:'sessions/new')
     end
   end

   delete '/sessions' do
     session[:user_id] = nil
     flash.keep[:notice] = 'Bye!'
     redirect to('/home')
   end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  post '/users' do
    @user = User.new(username: params[:username],
                      name: params[:name],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/home')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'users/new')
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
