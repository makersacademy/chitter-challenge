require 'sinatra/base'
require './lib/peep'
require 'pg'

class Chitter < Sinatra::Base
  get '/' do
    "Hello chitter!"
  end

  get '/new' do
    erb :new_peep
  end

  post '/new' do
    ENV['RACK_ENV'] = 'test'
    Peep.create(peep: params['peep'])
    redirect '/peep'
  end

  get '/peep' do
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec("SELECT peep, time FROM peeps ORDER BY time DESC LIMIT 1;")
    @peep = result[0]['peep']
    @time = result[0]['time']
    erb :peeps
  end
end
