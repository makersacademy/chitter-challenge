require 'sinatra/base'
require './model/user'
require 'Bcrypt'

ENV['RACK_ENV'] ||= 'development'

class App < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @user = session[:user_session]
    erb :'index'
  end

  get '/sign_up' do
    erb :'sign_up'
  end

  post '/create_user' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_session] = User.first(name: params[:name])
    redirect '/'
  end

  get '/sign_in' do
    erb :'sign_in'
  end

  post '/sign_in_check' do
    redirect '/' if User.validate(params[:username], params[:password])
    redirect '/sign_in'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
