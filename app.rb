require 'sinatra/base'
require './lib/users.rb'
require './lib/messages.rb'
require './database_connection_setup'

class Chitter < Sinatra::Base
  
  get '/' do
    erb :index
  end

  get '/chitter' do
    erb :chitter
  end

  post '/chitter' do
    
  end

  get '/messages' do
    erb :posting_messages
  end

  run! if app_file == $0
end
