require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter"
  end

  get '/peep' do
    erb :peep
  end

  post '/peeproom' do
    Peep.all
    erb :peeproom
  end
end
