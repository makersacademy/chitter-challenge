require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader 
  end

  get '/' do
    erb(:welcome)
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb(:peeps)
  end

  get '/write' do
    erb(:write)
  end

  post '/peeps' do
    peep = params['peep']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
    redirect '/peeps'
  end

  run! if app_file == $0

end
