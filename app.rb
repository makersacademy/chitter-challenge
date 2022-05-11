require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions

  get '/signup' do

    erb :signup
  end

  post '/signup' do

    redirect to '/login'
  end

  get '/login' do

    erb :login
  end

  post '/login' do

    redirect to '/peep'
  end

  get '/peep' do

    erb :peep
  end

  post '/peep' do
    Peep.create(peep_text: params[:peep_text])
    # peep_text = params['peep_text']
    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec("INSERT INTO peeps (peep_text) VALUES('#{peep_text}')")
    redirect to :wall
  end

  get '/wall' do
    @peeps = Peep.all
    erb :wall
  end

  run! if app_file == $0
end
