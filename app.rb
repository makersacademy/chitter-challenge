require 'sinatra/base'

class ChitterApp < Sinatra::Base
  
  get '/' do
    "Welcome to Chitter"
  end

  get '/peep' do
    erb :index
  end

  get '/peep/new' do
    @peep = Peep.all
    erb :peep
  end


  run! if app_file == $0
end
