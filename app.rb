require 'sinatra/base'
require 'sinatra/reloader'
# require './lib/chitter'
require './lib/peep'
require './lib/database_connection_setup'

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/homepage'
  end

  get '/homepage' do
     @all_peeps = Peep.all
    erb :homepage
  end

  get '/peep' do
    erb :create_peep
  end

  post '/peep' do
    Peep.create(content: params[:peep_content])
    redirect '/homepage'
  end


  run! if app_file == $0
end