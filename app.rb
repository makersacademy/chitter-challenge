ENV["ENVIRONMENT"] ||= "development"
require 'sinatra/base'
require './lib/comment'
require './lib/user'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'date'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/home'
  end

  get '/home' do
    @user = User.get(session[:user_id])
    @comments = Comment.all
    erb :index
  end

  post '/new' do
    Comment.create(comment: params[:message], created_by: params[:user])
    redirect '/'
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    if user.save
      session[:user_id] = user.id
      flash.next[:success] = 'Sign up successful!'
      redirect '/'
    else
      flash.next[:errors] = user.errors.full_messages
      redirect '/sign-up'
    end
  end

  get '/log-in' do
    erb :log_in
  end

  post '/log-in' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.next[:errors] = 'Incorrect log in details'
      redirect '/log-in'
    end
  end

  post '/log-out' do
    session[:user_id] = nil
    redirect '/'
  end

end
