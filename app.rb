require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './db_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end
    

  run! if app_file == $0
end
