require 'sinatra/base'
require './lib/chitter'
require './lib/database_connection_setup'
require './lib/user'



class Chitters < Sinatra::Base

  get '/' do
    @chitter = Chitter.all
    erb :index
  end

  post '/message' do
    Chitter.create(message: params[:message])
    redirect '/'
  end
  get '/new-user' do
    erb :new_user
  end

  post '/new' do
    User.create(name: params[:name], email: params[:email], password:[:password], user_id: params[:id])
    redirect '/welcome'
  end
  get '/welcome' do
    erb :welcome
  end
end
