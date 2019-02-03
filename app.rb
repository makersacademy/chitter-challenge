require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    peep = params[:peep]
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}');")
    redirect '/peeps'
  end

  run! if app_file == $0
end
