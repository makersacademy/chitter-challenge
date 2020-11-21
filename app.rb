require 'dotenv/load'
require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup.rb'
require './lib/user'
require './lib/peep'


class ChitterController < Sinatra::Base
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET']
  register Sinatra::Flash

  get '/' do
    erb(:login_page)
  end

  get '/create-account' do
    erb(:register)
  end

  post '/create-account' do
    if User.create(username: params[:username], email: params[:email], password: params[:password])
      flash[:notice] = "Account created succesfully, log in below!"
      redirect('/')
    else
      flash[:notice] = "Account name/email exist, try again!"
      redirect('/create-account')
    end
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])

    if user
      session[:user] = user
      redirect('/app')
    else
      flash[:notice] = "Account name or password invalid, try again!"
      redirect('/')
    end    
  end

  get '/app' do
    # "Welcome #{session[:user].username}!"
    erb(:app)
  end

  run! if app_file == $0
end