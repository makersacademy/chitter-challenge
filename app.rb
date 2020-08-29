require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    # peep = params[:"What's happening?"]
    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}');")
    Peep.create(peep: params[:"What's happening?"])
    redirect '/peeps'
  end

  run! if app_file == $0
end
