require 'sinatra/base'
require './lib/message.rb'
require 'pg'

class Chitter < Sinatra::Base
    
  get '/' do
    redirect('/messages')
  end

  get '/messages' do
    $messages = Message.all
    erb :message_board
  end

  post '/messages/new' do
    Message.create(content: params['content'])
    redirect '/messages'
  end

  run! if app_file == $0
end
