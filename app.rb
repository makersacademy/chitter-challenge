require 'sinatra/base'
require './lib/chitter'

class Chitter < Sinatra::Base 

  get '/' do
    @cheeps = Cheep.all
    erb :index
  end

  get '/cheep/new' do 
    erb :"cheep/new"
  end

  post '/' do
    cheep = params['cheep']
    connection = PG.connect(dbname: 'cheep_Test')
    connection.exec("INSERT INTO chitter (cheep) VALUES('#{url}')")
    redirect '/'
  end


  run! if app_file == $0

end