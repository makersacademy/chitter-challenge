require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/message' do
    redirect '/index'
  end
end
