require 'sinatra/base'
require 'pg'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/new-peep' do
    erb(:peep_form)
  end

  post '/new-peep' do
    p Peep.create(peep: params[:peep])
    redirect '/'
  end

  run! if app_file == Chitter
end
