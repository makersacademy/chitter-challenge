require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/' do
    message = params['message']
    connection = PG.connect(dbname: 'chitter_test')
    Peep.create(message: message)
    redirect '/'
  end

  run! if app_file == $0

end
