require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base

  get '/chitter' do
    @peeps = Peeps.all
    erb :chitter
  end

  post '/chitter' do
    @new_peep = params['post']
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peeps;')
    connection.exec("INSERT INTO peeps (peep) VALUES('#{@new_peep}')")
    redirect '/chitter'
  end

    run! if app_file == $0
end