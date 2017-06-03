require 'sinatra/base'
require './app/datamapper_setup'

class Chitter < Sinatra::Base

  get '/messages' do
    @message = Message.new('peep')
    erb :index.rb
  end

end
