require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/add_a_new_peep' do
    erb :add_a_new_peep
  end

  post '/create_new_peep' do
  message = params['message']
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
  redirect '/'
  end

  run! if app_file == $0

end
