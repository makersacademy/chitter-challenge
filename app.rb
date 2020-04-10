require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    "Hello world"
  end

  get '/add' do
    erb :'chitter/add'
  end

  post '/add' do
    "You Peeped"
  end

end