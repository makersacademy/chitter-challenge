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

  # before do
  #   @chitter = Chitter.all(id: session[:id])
  # end

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :"sessions/new"
  end

  post '/sessions' do
    if User.find(params[:username], params[:password]) == false
      flash[:notice] = "Please submit a valid username or password."
      redirect('/')
    else
      user = User.authenticate(username: params[:username], password: params[:password])
      @chitter = Chitter.all(id: user.id)
      session[:id] = user.id
      session[:username] = user.username
      session[:password] = params[:password]
      @username = session[:username]
      @password = session[:password]
      @user_id = session[:id]
      erb :"tweets/index"
    end
  end

  get '/sessions/sign_up' do
    @user_id = session[:id]
    @username = session[:username]
    @password = session[:password]
    erb :"users/new"
  end

  post '/sessions/new' do
    flash[:notice] = 'New account created'
    @user_id = session[:id]
    @password = session[:password]
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect('/')
  end

  get '/tweets/index' do
    @user_id = session[:id]
    @chitter = Chitter.all(id: @user_id)
    @username = session[:username]
    @password = session[:password]
    erb :"tweets/index"
  end

  get '/tweets' do
    @user_id = session[:id]
    @chitter = Chitter.all(id: @user_id)
    @username = session[:username]
    @password = session[:password]
    Chitter.add(tweet: params[:tweet], time: Time.new.strftime("%k:%M %p"), user_id: @user_id)
    erb :"tweets/index"
  end

  post '/index' do
    @user_id = session[:id]
    @username = session[:username]
    @password = session[:password]
    @chitter = Chitter.all(id: @user_id)
    erb :"tweets/index"
  end

  post '/all' do
    @user_id = session[:id]
    @chitter = Chitter.view_all
    @username = session[:username]
    @password = session[:password]
    erb :"tweets/index"
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  run! if app_file == $0
end