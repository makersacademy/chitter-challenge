require 'sinatra'
require 'sinatra/activerecord'
require './models/message'
require './models/user'

set :database_file, 'config/database.yml'

class App < Sinatra::Base

  enable :sessions
  enable :method_override

  get '/' do
    @messages = Message.all
    erb :index
  end

  post '/message' do
    @message = Message.create({ :content => params[:message] })
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    session[:user] = User.create(name: params[:Name],
       username: params[:Username], email: params[:Email], password: params[:Password])
    redirect '/profile/:id'
  end

  get '/profile/:id' do
    @id = session[:user].id
    @user = User.find(@id)
    erb :profile
  end

end
