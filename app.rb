require 'sinatra/base'
require './lib/chitter'

class ChitterChallenge < Sinatra::Base

  get '/' do
    "Chitter Challenge!"
  end

  get '/chitter' do
    @chitters = Chitter.all
    erb :index
  end

  get '/chitter/new' do
    erb :new
  end

  post '/chitter' do
  peep = params['peep']
  connection = PG.connect(dbname: 'chitter_challenge')
  connection.exec("INSERT INTO chitters (peep) VALUES('#{peep}') ")
  redirect '/chitter'
end


  run if app_file == $0
end
