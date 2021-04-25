require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :index
  end

  # post '/chitter' do
  #   peep = params['peep']
  #   connection = PG.connect(dbname: 'chitter_test')
  #   connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
  #   redirect '/'
  # end
  
  run! if app_file == $0
end
