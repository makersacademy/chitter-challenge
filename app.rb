require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/chitter' do
    "Chitter!!"
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
    redirect '/peeps'
  end

  # establish server if file run directly
  run! if app_file == $0
end
