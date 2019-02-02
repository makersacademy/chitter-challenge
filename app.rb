require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  get '/' do
    erb(:sign_up)
  end

  get '/create' do
    erb(:create_message)
  end

  post '/storage' do
    Message.create(message: params[:message])
    redirect '/messages'
  end

  get '/messages' do
    @tweets = Message.display
    erb(:list_of_messages)
  end

end
