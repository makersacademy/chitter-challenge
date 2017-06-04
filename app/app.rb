require 'sinatra/base'
require './app/datamapper_setup'
require 'dotenv/load'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, ENV['SESSION_SECRET']

  get '/' do
    redirect to '/messages'
  end

  get '/messages' do
    @messages = Message.all.reverse
    erb :index
  end

  get '/messages/new' do
    erb :post_message
  end

  post '/messages' do
    Message.create(content: params[:content], time: Time.now)
    redirect '/messages'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect to '/messages/new'
    else
      user.errors.full_messages.join('<br>')
    end
  end

  get '/users/signin' do
    erb :'users/signin'
  end

  post '/users/signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/messages'
    else
      'Invalid username/password'
    end
  end

  get '/users/signout' do
    session[:user_id] = nil
    redirect to '/messages'
  end

  helpers do

    def current_user
      @current_user ||= User.get(session[:user_id])
    end

  end

end
