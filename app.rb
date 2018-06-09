require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/peep' do
    redirect '/chitter'
  end

  get '/chitter' do
    erb :chitter
  end
end
