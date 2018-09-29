require 'sinatra/base'
require './lib/messages'

class Chitter < Sinatra::Base

  get '/' do
    'Displaying Messages'
  end

  get '/messages' do
      @messages = Messages.all
      erb :'messages/index'
  end

  run! if app_file == $0
end
