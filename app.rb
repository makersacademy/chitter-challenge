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

  post '/message' do
    message = Message.create(content: params[:content])
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.authenticate(params[:email], params[:password])
    if user
      redirect '/error'
    else  
      user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
      if user
        session[:user_id] = user.id
        redirect ("/profile")
      else
        redirect '/'
      end
    end
  end

  get '/signin' do
    erb :signin
  end

  post '/signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect ("/profile")
    else
      redirect '/'
    end
  end

  get '/profile' do
    if signed_in?
      @messages = Message.all
      erb :profile
    else
      redirect 'signin'
    end
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
    @current_user ||= User.get(session[:user_id])
  end

  run! if app_file == $0
end