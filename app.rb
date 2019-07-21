require 'sinatra/base'
require './lib/peep'
require './lib/database_connection_setup'
require './lib/database_connection'


class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end


  get '/new' do
    erb :'new_peep'
  end

  post '/peep' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :'peeps'
  end

  run! if app_file == $0
end
