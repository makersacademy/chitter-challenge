require 'sinatra/base'
require './lib/chitter.rb'
require './database_connection_setup'

class Chitter < Sinatra::Base

  get '/peep' do
    erb(:peep)
  end

  post '/peep' do
    Peep.save(peep: params[:peep])
    redirect '/'
  end

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  run! if app_file == $0

end
