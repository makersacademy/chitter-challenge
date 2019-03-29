require 'sinatra/base'
require 'pg'
require './lib/message'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base

  get '/chitter' do
    @messages = Message.all
    erb :'chitter/index'
  end

  post '/chitter/create' do
    Message.create(text: params[:text])
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

    User.create(email: email, password: password, first_name: first_name, surname: surname, username: username)
    erb :'chitter/thank_you'
  end
end
