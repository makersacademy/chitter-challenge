require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter"
  end

  get '/peep' do
    erb :peep
  end

  post '/peeproom' do
    @peep = params[:peep]
    erb :peeproom
  end
end
