require 'sinatra/base'
require './lib/peep.rb'
require './spec/database_connection_setup.rb'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Peep.display
    erb :'chitter/index'
  end

  post '/chitter' do
    Peep.create(peep: params[:peep])
    redirect '/chitter'
  end

  run! if app_file == $0
end