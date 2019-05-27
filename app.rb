require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/create-peep' do 
    peep = Peep.create(peep: params['peep'])

    p params

    redirect '/'
  end

  run! if app_file == $0
end
