require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do  
    erb :index
  end
  
  get '/peep' do
    "Peep your thoughts."
  end

  run! if app_file == $0
end
