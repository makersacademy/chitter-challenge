require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do 
    erb :index
  end

  get '/create_peep' do
    erb :new_peep
  end

  post '/submit_peep' do
  end
end