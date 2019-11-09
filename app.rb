require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do  
    erb :index
  end

  get '/peeps' do
    peeps = [
      "Test Peep 1",
      "Test Peep 2",
      "Test Peep 3"
    ]
    peeps.join
  end
  
  get '/new-peep' do
    "Peep your thoughts."
  end

  run! if app_file == $0
end
