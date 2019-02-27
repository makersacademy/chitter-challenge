require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/add-peep' do
    erb :add_peep
  end
end
