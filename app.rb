require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/new-peep' do
    peep = params['peep']
    connection = PG.connect(dbname: 'Chitter_Manager_test')
    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
    redirect '/'
  end

  run! if app_file == $0
end
