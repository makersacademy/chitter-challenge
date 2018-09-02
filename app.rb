require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/feed'
  end

  get '/feed' do
    @peep = Peep.all
    erb :feed
  end

  post '/feed' do
    peep = params['peep']
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO peeps (text) VALUES('#{peep}')")
    redirect '/feed'
  end

  run! if app_file == $0
end
