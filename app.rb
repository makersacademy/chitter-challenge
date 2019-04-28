require 'sinatra/base'
require './lib/message'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :homepage
  end

  post '/' do
    User.create(name: params[:sign_up_name],
                username: params[:sign_up_username],
                email: params[:sign_up_email],
                password: params[:sign_up_password])
    redirect '/'
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages/new' do
    Message.post(text: params[:message])
    redirect '/messages'
  end

  get '/messages' do
    @messages = Message.all
    erb :'messages/index'
  end

end
