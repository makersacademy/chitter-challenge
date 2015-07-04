require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Hi'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    redirect '/'
  end
end
