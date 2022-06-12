require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    'Hello World'
  end

  get '/chitter' do
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM chitter;")
    result.map { |peep| @peep = peep['peep'] }
    erb:'chitter'
  end

  post '/chitter' do
    peep = params[:peep]
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO chitter (peep) VALUES('#{peep}')")
    redirect '/chitter'
  end

  get '/chitter/new' do
    erb :'chitter/new'
  end

  run! if app_file == $0

end
