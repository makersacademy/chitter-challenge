require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/chitter' do 
    @peeps = Peep.all
    erb :new
  end

  post '/chitter' do
    Peep.create(peep: params[:peep])
    redirect '/chitter'
  end
  
  run! if app_file == $0
end
