require 'sinatra'
require 'sinatra/base'
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
    Message.create({ :content => params[:message] })
    redirect '/'
  end

  get '/signup' do
    session[:error] ||= nil
    @error = session[:error]
    erb :signup
  end

  post '/signup' do
    session[:id] = User.create(name: params[:Name],
    username: params[:Username], email: params[:Email], password: params[:Password]).id
    if session[:id] != nil
      redirect '/profile/:id/home'
    else
      session[:error] = "Email already in use!! Try logging in..."
      redirect '/signup'
    end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    @user = User.find_by(username: params["Username"], password: params["Password"])
    session[:id] = @user.id
    p session[:id]
    redirect '/profile/:id/home'
  end

  get '/profile/:id/home' do
    @id = session[:id]
    @user = User.find(@id)
    @messages = Message.all
    erb :profile
  end

  post '/profile/:id/profile/message' do
    Message.create({ :content => params[:message], :user_id => session[:user].id })
    redirect '/profile/:id/home'
  end

  post '/logout' do
    session.clear
    redirect '/'
  end

end
