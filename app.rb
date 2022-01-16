require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peeps'


class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    
  end

  get '/' do
    
    'Chitter'
  end

  get '/peeps' do
    @peeps = Peeps.all   
    erb :'index'
  end

  get '/peeps/new' do
    erb :'new'
  end

  post '/peeps' do
    'Test peep'
    peep = params['peep']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO chitter VALUES('#{peep}')")
    redirect '/peeps'
  end



  run! if app_file == $0
end