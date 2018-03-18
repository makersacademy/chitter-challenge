require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  #register Sinatra::Flash

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/add-a-new-peep' do
   erb :add_a_new_peep
  end

  post '/create-new-peep' do
    Peep.create(peep: params['peep'])
    redirect '/'
  end
  run! if app_file == $0
end
