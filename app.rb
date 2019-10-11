require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/chitter' do
    @peeps = Peep.all.reverse
    erb :index
  end

  post '/newpeep' do
    Peep.create(peep: params['peep'])
    redirect '/chitter'
  end

  # run! if app_file = $0

end
