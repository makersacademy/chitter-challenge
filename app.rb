require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/create-peep' do 
    Peep.create(peep: params['peep'])
    redirect '/'
  end

  run! if app_file == $0
end
