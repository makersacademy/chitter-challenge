require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/user' do
    erb :'user/new'
  end

  post '/user' do
    erb :index
  end

end
