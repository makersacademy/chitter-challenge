require 'sinatra/base'
require './lib/message'
require './lib/user'
require './lib/controller_helper'

class Chitter < Sinatra::Base

  get '/' do
    erb(:page_one)
  end

  get '/start' do
    erb(:sign_up)
  end

  post '/storage_users' do
    User.create(email: params[:your_email], password: params[:your_password],
      name: params[:user_name])
    condition(params[:your_email], params[:your_password], params[:user_name])
    redirect '/create'
  end

  get '/create' do
    mail = User.find
    @e_mail = mail.join("")
    erb(:create_message)
  end

  post '/storage_message' do
    Message.create(message: params[:message])
    redirect '/messages'
  end

  get '/messages' do
    @tweets = Message.display
    erb(:list_of_messages)
  end

  get '/messages2' do
    @tweets = Message.display
    erb(:list_of_messages_two)
  end

end
