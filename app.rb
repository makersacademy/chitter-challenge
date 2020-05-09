require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
    erb :home
  end

  get '/peeps' do
    connection = PG.connect(dbname: 'chitter')
    @peep = connection.exec("SELECT * FROM peeps;")
    p "@peep #{@peep}"
    erb :'/peeps/index'
  end

  post '/peeps' do
    p "Params #{params}"
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO peeps (peep) VALUES('#{params['peep']}');")
    redirect '/peeps'
  end

  run! if app_file == $0
end
