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
    session[:error] ||= nil
    @error = session[:error]
    @messages = Message.all
    erb :index
  end

  post '/message' do
    session[:error] = "Sign up to post messages! "
    redirect '/'
  end

  get '/signup' do
    @error = session[:error]
    erb :signup
  end

  post '/signup' do
    session[:id] = User.create(
      name: params[:Name],
      username: params[:Username],
      email: params[:Email],
      password: params[:Password]).id

    if session[:id] != nil
      redirect '/profile/:id/home'
    else
      session[:error] = "Email already in use!! Try logging in..."
      redirect '/signup'
    end
  end

  get '/login' do
    @error = session[:error]
    erb :login
  end

  post '/login' do
    @user = User.authenticate(params["Username"], params["Password"])
    if @user
      session[:id] = @user.id
      redirect '/profile/:id/home'
    else
      session[:error] = 'Incorrect details'
      redirect '/login'
    end
  end

  get '/profile/:id/home' do
    if signed_in?
      @id = session[:id]
      @user = User.find(@id)
      @messages = Message.all
      erb :profile
    else
      redirct '/'
    end
  end

  post '/profile/:id/profile/message' do
    Message.create({ :content => params[:message], :user_id => session[:id] })
    redirect '/profile/:id/home'
  end

  post '/logout' do
    session.clear
    redirect '/'
  end

  private

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:id])
  end
end
