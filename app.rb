require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/timeline' do
    @peeps = Peep.all
    erb :timeline
  end

  get '/new' do
    erb :new
  end

  post '/timeline' do
    peep = params['peep']
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end
    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
    redirect '/timeline'
  end

  run! if app_file == $0
end
