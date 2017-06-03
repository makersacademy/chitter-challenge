require 'sinatra/base'
require './app/datamapper_setup'

class Chitter < Sinatra::Base

  get '/messages/new' do
    message = Message.all
    erb :post_message
  end

end
