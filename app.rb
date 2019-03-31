require 'sinatra/base'
require 'pg'
require './lib/message'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/chitter' do
    @messages = Message.all
    @user = session[:user]
    erb :'chitter/index'
  end

  post '/chitter/create' do
    @user = session[:user]
    if @user
      Message.create(text: params[:text], user_id: @user.id)
    else
      Message.create(text: params[:text])
    end
    redirect '/chitter'
  end

  get '/chitter/sign_up' do
    erb :'chitter/sign_up'
  end

  post '/chitter/sign_up' do
    email = params[:email]
    password = params[:password]
    first_name = params[:first_name]
    surname = params[:surname]
    username = params[:username]

    user = User.create(email: email, password: password, first_name: first_name, surname: surname, username: username)
    if user
      @message = "Thank you, you have successfully signed up"
    else
      @message = "The username or email address you entered is already in use"
    end
    erb :'chitter/thank_you'
  end

  get '/chitter/sessions/new' do
    erb :'chitter/sessions'
  end

  post '/chitter/sessions/new' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user] = user
      redirect '/chitter'
    else
      redirect 'chitter/sessions/new'
      # Needs an error message to be displayed
    end
  end

  get '/chitter/sessions/destroy' do
    session.clear
    redirect 'chitter'
  end
end
