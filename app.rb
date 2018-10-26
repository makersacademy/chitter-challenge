require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/post' do
    Peep.post(params['peep_content'])
    redirect '/'
  end

  run! if app_file == $0
end
