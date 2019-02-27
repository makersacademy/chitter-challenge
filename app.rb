require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/add-chitter' do
    erb :add_chitter
  end
end
