require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'
require_relative './lib/database_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    redirect '/chitter'
  end
  
  get '/chitter' do
    @peep = Peep.all
    erb :index
  end

  get '/newpeep' do
    erb :new_peep
  end

  post '/newpeep' do
    Peep.add(params[:peep_text])
    redirect '/'
  end

  run! if app_file == $0
end