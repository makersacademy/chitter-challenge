require 'sinatra/base'
require './lib/chitter'

class ChitterApp < Sinatra::Base

  # get '/' do
  #   'test peep'
  # end

  get '/' do
    @peeps = Chitter.view
    erb :index
  end
  #
  get '/new' do
    erb :new
  end

  post '/new' do
    message = params['message']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES ('#{message}')")
    redirect '/'
  end
end
