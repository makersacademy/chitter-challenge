require 'sinatra/base'
# require './lib/chitter'

class ChitterApp < Sinatra::Base

  get '/chitter' do
    @message = params[:message]
    erb :index
  end

  post '/chitter' do
    @message = params[:message]
    erb :index
  end
end
