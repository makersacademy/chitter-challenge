require 'sinatra/base'
require './lib/peep'

class ChitterManager < Sinatra::Base
  get '/' do
    'Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'index'
  end

  get '/new' do
    erb :'new'
  end

  post '/peeps' do
    message = params['message']
    connection = PG.connect(dbname: 'peep_manager_test')
    connection.exec("INSERT INTO peeps (message) VALUES (#{message});")
    redirect '/peeps'
  end

  run! if app_file == $0
end
