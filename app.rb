require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all.reverse
    erb :index
  end

  post '/chitter' do
    Peep.post_peep(params['peep'], params['username'])
    redirect('/')
  end

  run! if app_file == $0
end
