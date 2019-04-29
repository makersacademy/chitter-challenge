require 'sinatra/base'
require './lib/peep'

class ChitterChallenge < Sinatra::Base

  get '/' do
    redirect '/peeps/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    peep = params['peep']
    connection = PG.connect(dbname: 'peeps')
    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
    redirect '/peeps'
  end

  run! if app_file == $0
end
