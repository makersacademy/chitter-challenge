require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/messages' do
    @tweets = Message.display
    erb(:list_of_messages)
  end

end
