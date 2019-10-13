require 'sinatra/base'
require './lib/peep'
require './spec/database_connection_setup'
require 'date'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all_in_order
    erb :index
  end

  post '/peep' do
    Peep.create(message:params['peep'])
    redirect '/'
  end
  

  # start the server if ruby file executed directly
  run! if app_file == $0
end
