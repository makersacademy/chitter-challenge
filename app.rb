require 'sinatra/base'
require 'sinatra'
require_relative './lib/message'
require 'sinatra/flash'
require_relative './lib/login'

class ChitterManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :homepage
  end

  get '/register' do
    erb :register
  end

  post '/login' do
    if Login.valid?(params[:username], params[:password])
      session[:username] = params[:username]
    else
      flash[:error] = "Incorrect username or password"
    end
    redirect '/'
  end

  post '/register' do
    if Login.exists?(params[:username])
      flash[:error] = "Username already exists"
      redirect '/register'
    else
      User.create(username: params[:username], firstname: params[:firstname], lastname: params[:lastname], email: params[:email], password: params[:password]).valid?
      redirect '/'
    end
  end

  post '/post_message' do
    Post.create(content: params[:content], created_at: Time.now, user_id: User.first("#{session[:user]}")[:id])
    redirect '/'
  end

  get '/logout' do
    session[:username] = nil
    redirect '/'
  end

  run! if app_file == $0
end
