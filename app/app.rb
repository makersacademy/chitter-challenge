require 'sinatra/base'
require 'sinatra/flash'
require './app/models/user'


class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  helpers do
    def current_user
      @current_user = User.first(id: session[:user_id])
    end
  end

  get '/' do
    erb :'temp'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(name: params[:name],
                    username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user.save
      "User saved"
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.first(email: params[:email])
    if user.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect('/')
    else
      flash.now[:errors] = ['Incorrect email or password']
      erb :'sessions/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
