require 'sinatra/base'
require './lib/peep.rb'

class ChitterChallenge < Sinatra::Base
  get '/' do 
    "Peep test message"
  end

  get '/chitter' do 
    p ENV
    @peeps = Peep.read
    erb :'chitter/index'
  end

  get '/chitter/new' do
    erb :"chitter/new"
  end

  post '/chitter' do
    peeps = params['peeps']
    connection = PG.connect(dbname: 'chitter_challenge_test')
    connection.exec("INSERT INTO chitter (peeps) VALUES('#{peeps}')")
    redirect '/chitter'
  end
  
  run! if app_file == $0
end
  