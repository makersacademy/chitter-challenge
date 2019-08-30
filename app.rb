require 'sinatra/base'
require './lib/chitter'

class ChitterManager < Sinatra::Base
  enable :sessions

  get '/chitter' do
    p ENV
    @chitter = Chitter.all
    erb :new
  end

  post '/chitter' do
    message = params['message']
    connection = PG.connect(dbname: 'chitter_manager_test')
    connection.exec("INSERT INTO chitter (message) VALUES('#{message}')")
    redirect '/chitter'
  end

  get '/chitter/new' do
    erb :"chitter/new"
  end

  run! if app_file == $0
end
