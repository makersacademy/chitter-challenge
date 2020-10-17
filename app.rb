require 'sinatra/base'
require './lib/peep'
require './lib/db_env_setup'

class Chitter < Sinatra::Base

  get '/' do
    # Peep.add(peep: params[:peep])
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    Peep.add(peep: params[:peep])
  end

end
