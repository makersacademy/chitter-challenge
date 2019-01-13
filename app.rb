ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './config/data_mapper'
require 'pry'

class Chitter < Sinatra::Base

  enable :sessions
  enable :method_override

  get '/' do
    @messages = Message.all
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:id] = user.id
    redirect '/signin'
  end

  get '/signin' do
    erb :signin
  end

  post '/signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:id] = user.id
      redirect("/profile/#{session[:id]}")
    else
      redirect '/'
    end
  end

  get '/profile/:id' do
    if signed_in?
      @user = User.get(params[:id])
      @users = User.all
      @messages = Message.all
      erb :profile
    else
      redirect 'signin'
    end
  end

  post '/message/:id' do
    @user = User.get(params[:id])
    message = Message.create({ user_id: session[:id], 
      content: params[:content] })
      redirect("/profile/#{session[:id]}")
  end

  get '/error' do
    erb :error
  end

  delete '/sessions' do
    session.delete(:user_id)
    redirect '/'
  end


  private

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.get(session[:id])
  end

  run! if app_file == $0
end