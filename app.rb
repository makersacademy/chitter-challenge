require 'sinatra/base'
require './lib/peep'
require './lib/db_env_setup'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    Peep.add(peep: params[:peep])
    redirect '/'
  end

end
