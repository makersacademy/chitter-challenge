require 'sinatra/base'
require 'sinatra/reloader'
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

  get '/' do
    @user = User.find(session[:user_id])
    erb :index
  end

  get '/tweets' do
    Chitter.add(tweet: params[:tweet], time: Time.new.strftime("%k:%M %p"))
    erb :index
  end

  get '/users' do
    erb :"users/new"
  end
  
  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect('/')
  end

  post '/index' do
    erb :index
  end

  run! if app_file == $0
end