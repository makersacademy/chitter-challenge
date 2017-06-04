require 'sinatra/base'
require './app/datamapper_setup'

class Chitter < Sinatra::Base

  get '/messages' do
    @messages = Message.all.reverse
    erb :index
  end

  get '/messages/new' do
    erb :post_message
  end

  post '/messages' do
    message = Message.create(content: params[:content], time: Time.now)
    message.save
    redirect '/messages'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    redirect to '/messages/new'
  end


end
