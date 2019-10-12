require 'sinatra/base'
require './lib/peep'
require './spec/database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/peep' do
    @peep = Peep.create(message:params['peep'])
    redirect '/'
  end
  

  # start the server if ruby file executed directly
  run! if app_file == $0
end
