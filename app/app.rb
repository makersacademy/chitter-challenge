ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require 'date'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, "himitsu"
  register Sinatra::Flash
  set :method_override, true
  { :expires => Time.now + 3600 }

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    if User.exists?(params[:username], params[:email]) == false
      new_user = User.create(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    else
      problem = User.exists?(params[:username], params[:email])
      flash.next[:error] = ["'#{params[problem.to_sym]}' is taken already, please choose a different #{problem}."]
      redirect to('/users/new')
    end
    if new_user.save
      session[:user_id] = new_user.id
      flash.next[:notice] = ["Welcome to Chitter, #{params[:username]}!"]
      redirect to('/dashboard')
    else
      flash.next[:error] = ["Passwords don't match, try again"]
      redirect to('/users/new')
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.login(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      flash.next[:notice] = ["Welcome back, #{params[:username]}!"]
      redirect to('/dashboard')
    else
      flash.next[:error] = ["Wrong username or password"]
      redirect to('sessions/new')
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = ["Good bye! We hope to see you again soon :)"]
    redirect to('/')
  end

  get '/dashboard' do
    erb :dashboard
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    message = Message.create(time: DateTime.now, content: params[:new_message], user_id: session[:user_id])
      if session[:user_id]
        flash.next[:notice] = ["Your message has been posted."]
      else flash.next[:error] = ["Something went wrong. Make sure you're logged in!"]
      end
      redirect to('/dashboard')
  end

  post '/messages/view' do
    redirect to("/messages/#{User.first(id: session[:user_id]).username}")
  end

  get '/messages/all' do
    @messages = Message.all
    erb :'messages/all'
  end

  get '/messages/*' do
    @user_messages = User.first(id: session[:user_id]).messages
    erb :'messages/user'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
