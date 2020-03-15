require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/test' do
    'Testing infrastructure'
  end

  get '/' do
    "Chitter"
  end

  get '/view-peeps' do
    @peeps = Peeps.all
    erb :"view-peeps"
  end

  get '/new-peep' do
    erb :"new-peep"
  end

  post '/view-peeps' do

    Peeps.create(peep: params['peep'])

    # peep = params['peep']
    # connection = PG.connect(dbname: 'chitter')
    # connection.exec("INSERT INTO chitter (peep) VALUES ('#{peep}');")
    redirect '/view-peeps'
  end

  run! if app_file == $0
end
