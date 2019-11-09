require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do  
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end
  
  get '/new-peep' do
    "Peep your thoughts."
  end

  run! if app_file == $0
end
