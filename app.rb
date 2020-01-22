require 'sinatra/base'
require 'pg'
require './lib/chitterbase'
# require './lib/chitterbase'

class Chitter < Sinatra::Base

  get '/chitter' do
    @peeps = Peeps.all
    erb :index
  end

  get '/chitter/new_peep' do
    erb :new
  end

  post '/chitter' do
    Peeps.create(peep: params['peep'])
    redirect '/chitter'
  end

  run! if app_file == $0
end
