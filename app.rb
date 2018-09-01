require 'sinatra/base'
require './lib/messages'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do
    redirect '/messages'
  end

  get '/messages' do
    @messages = Messages.show
    erb :messages
  end

  post '/messages' do
    p params
    Messages.add(params['content'])
    redirect '/messages'
  end

  post 'messages/delete/:id' do
    Messages.delete(params['id'])
    redirect '/messages'
  end
  
  run! if app_file == $0
end