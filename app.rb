require 'sinatra/base'
require_relative './lib/messages'

class Chitter < Sinatra::Base
  enable :sessions, :method_overide


  get '/' do
    # p "_____________ #{@message}"
    @message = Messages.all
    erb :'messages/index'
  end

  post '/add_message' do
    Messages.add(message: params[:message])
    redirect '/'
  end 

  post '/show'
    Messages.add(message: params[:message])
    redirect '/print'
  end 

  get '/print' do
    @message = Messages.all
    erb :'messages/show'
  end

  delete '/delete/:id' do
    Messages.delete(id: params[:id])
    redirect '/add_message'
  end

  run! if app_file == $0

end