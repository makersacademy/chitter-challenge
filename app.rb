require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  get '/messages' do
    @messages = Message.all
    erb :messages
  end

  post '/messages' do
    Message.create(text: params['text'])
    redirect '/messages'
  end

  run! if app_file == $0
end