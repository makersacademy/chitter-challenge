require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    # peep = params[:peep]
    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec("INSERT INTO peeps (text) VALUES('#{text}')")
    redirect '/peeps'
  end

  run! if app_file == $0

end
