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
    Message.create(text: "Hello World!")
    @messages = Message.all
    erb :messages
  end

  run! if app_file == $0
end