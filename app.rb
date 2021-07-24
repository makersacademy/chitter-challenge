require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello, World!'
  end
  
  get '/peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    @peeps = connection.exec("SELECT * FROM peeps;")
    erb(:"peeps/index")
  end
  
  get '/peeps/new' do
    erb(:"peeps/new")
  end
  
  post '/peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (text) VALUES ('#{params[:peep]}');")
    redirect '/peeps'
  end
  
  run! if app_file == $0
end
