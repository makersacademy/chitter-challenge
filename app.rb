require 'sinatra/base'
require_relative './lib/chitter'

class ChitterMessenger < Sinatra::Base

  get '/' do
    redirect '/messages'
  end

  get '/messages' do
    @messages = Chitter.all
    erb :'messages/index'
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    peep = params['peep']
    connection = PG.connect(dbname: 'chitter_messenger_test')
    connection.exec("INSERT INTO messages (peep) VALUES('#{peep}')")
    redirect '/messages'
  end

  run! if app_file == $0
end
