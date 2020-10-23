require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base  
  
  get '/' do
    'Welcome to Chitter!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = params["Peep"]
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT into peeps (peep) VALUES('#{peep}');")
    redirect '/peeps'
  end

  run! if app_file == $0
end
