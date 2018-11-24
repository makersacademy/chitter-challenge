require 'sinatra'


class ChitterChatter < Sinatra::Base

  get '/messages' do
    'Hello World'
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post 'messages' do
    redirect '/messages'
  end


  run! if app_file == $0
end