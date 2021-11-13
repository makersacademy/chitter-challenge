require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter page working!'
  end

  get '/peep' do
    @peeps = Peep.all
    erb :'index'
  end

  post '/peeps' do
    peep = params['peep']
    connection = PG.connect(dbname: 'Peeps')
    connection.exec("INSERT INTO Peeps (peep) VALUES('#{peep}')")
    redirect '/peep'
  end

  run! if app_file == $0
end