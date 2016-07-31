ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'


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
    'Hello Chitter!'
  end

  get '/users/register' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user =User.create(email: params[:emai],
                password: params[:password],
                name: params[:name],
                user_name: params[:user_name],
                password_confirmation: params[:password_confirmation])
    if @user.save
    session[:user_id] = @user.id
    redirect to('/home')
    else
      flash.now[:notice] = "Please make sure Password and Confirmation Password match"
      erb :'users/register'
  end

  get '/home' do
   erb :'home'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/home')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
