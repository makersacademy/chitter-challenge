require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/chitter'
require './lib/tweet'
require './lib/user'
require 'date'
require 'uri'
require './lib/database_connection.rb'
require_relative './lib/database_connection_setup'

class ChitterChat < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  before do
    @chitter = Chitter.all
  end

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :"sessions/new"
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  post '/sessions' do
    if User.find(params[:username], params[:password]) == false
      flash[:notice] = "Please submit a valid username or password."
      redirect('/')
    else
      user = User.authenticate(username: params[:username], password: params[:password])
      session[:user_id] = user.id
      session[:username] = user.username
      @username = session[:username]
      erb :"tweets/index"
    end
  end

  get '/tweets/index' do
    @username = session[:username]
    erb :"tweets/index"
  end

  get '/tweets' do
    Chitter.add(tweet: params[:tweet], time: Time.new.strftime("%k:%M %p"))
    @username = session[:username]
    erb :"tweets/index"
  end

  get '/users/new' do
    @username = session[:username]
    erb :"users/new"
  end
  
  post '/users/new' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:id] = user.id
    redirect('/tweets')
  end

  post '/index' do
    @username = session[:username]
    erb :"tweets/index"
  end

  run! if app_file == $0
end