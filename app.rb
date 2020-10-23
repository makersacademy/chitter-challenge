require 'sinatra/base'
require './lib/message'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb(:sign_up)
  end

  post '/sign_up' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/messages'
  end

  get '/messages' do
    @messages = Message.all
    erb(:index)
  end

  post '/messages' do
    Message.create(message: params[:peep])
    redirect '/messages'
  end

  get '/messages/new' do
    erb(:new)
  end

  get '/test' do
    "Testing, 1, 2, 3..."
  end

end
