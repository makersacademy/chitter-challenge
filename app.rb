require 'sinatra/base'
require './lib/message.rb'
require './database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/chitter' do
    @messages = Message.all
    erb :index
  end

  post '/post_peep' do
    Message.create(text: params[:peep])
    redirect '/chitter'
  end

  run! if app_file == $0
end
