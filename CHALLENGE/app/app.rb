ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative './data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/homepage'
  end

  get '/homepage' do
    erb :homepage
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/login' do
    erb :user_login
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/new_user' do
    user = User.create(username: params['Username'],
                       email:    params['E-mail'],
                       password: params['Password'])
    session[:user_id] = user.id
    redirect '/login'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/login')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
