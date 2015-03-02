require 'sinatra/base'
require 'data_mapper'
require_relative 'helper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative 'models/message'
require_relative 'models/user'

DataMapper.finalize

DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'secret'

  get '/' do
    @messages = Message.all
    erb :index
  end

  post '/' do 
    erb :index
  end

  get '/users/new' do 
    @user = User.new
    erb :"/users/new"
  end

  post '/users/new' do 
    @user = User.create(:name => params[:name], :email => params[:email], :password => params[:password])
    session[:user_id] = @user.id
    @user.save
    redirect to '/'
  end

  post '/messages' do 
    content = params[:content]
    Message.create(:content => content)
    redirect to '/'
  end

  get '/login' do 
    erb :login
  end

  post '/login' do 
    name, password = params[:name], params[:password]
    user = User.authenticate(name, password)
    if user
      session[:user_id] = user.id
      redirect to '/users/home'
    else
      redirect to '/' 
    end
  end

  delete '/login' do
    session[:user_id] = nil
    redirect to '/'
  end

  get '/users/home' do 
    erb :"/users/home"
  end

  post '/users/home' do 
    @messages = Message.current_user
    redirect to '/users/home'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
