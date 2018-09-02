require 'sinatra/base'
require './lib/messages'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/' do
    session[:user_name] = params[:name]
    redirect '/messages'
  end

  get '/messages' do
    @messages = Messages.show
    erb :messages
  end

  post '/messages' do
    p params
    Messages.add(params['content'], session[:user_name])
    redirect '/messages'
  end
  
  post '/messages/delete/:id' do
    Messages.delete(params['id'])
    redirect '/messages'
  end
  
  run! if app_file == $0
end